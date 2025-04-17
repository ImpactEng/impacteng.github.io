# Stage 1: Build stage
FROM ruby:3.4-slim AS builder

# Install build dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential git libssl-dev libreadline-dev zlib1g-dev curl \
    libffi-dev libyaml-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user early to ensure rbenv is installed in their home directory
RUN useradd -m -u 1000 jekylluser

# Set up rbenv for the non-root user
USER jekylluser
ENV HOME=/home/jekylluser
ENV RBENV_ROOT=$HOME/.rbenv
ENV PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
RUN git clone --depth 1 --branch v1.3.2 https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    git clone --depth 1 --branch v20250415 https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build && \
    echo 'export RBENV_ROOT=$HOME/.rbenv' >> $HOME/.bashrc && \
    echo 'export PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH' >> $HOME/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

# Install Ruby (pinned version)
RUN rbenv install 3.4.3 && rbenv global 3.4.3

# Update gem (pinned version)
RUN gem update --no-document --system 3.6.8

# Install Jekyll and Bundler with pinned versions
RUN gem install --no-document jekyll -v 4.4.1 && gem install --no-document bundler -v 2.6.8

# Stage 2: Final stage
FROM ruby:3.4-slim

# Install runtime dependencies only
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    libssl-dev libreadline-dev zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 1000 jekylluser && \
    mkdir -p /app && \
    chown -R jekylluser:jekylluser /app

# Copy rbenv and Ruby from builder stage
USER jekylluser
ENV HOME=/home/jekylluser
ENV RBENV_ROOT=$HOME/.rbenv
ENV PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
COPY --from=builder --chown=jekylluser:jekylluser $RBENV_ROOT $RBENV_ROOT
COPY --from=builder --chown=jekylluser:jekylluser $HOME/.bashrc $HOME/.bashrc

# Set working directory
WORKDIR /app

# Create a start script with detailed debugging output
RUN echo '#!/bin/bash' > /home/jekylluser/start.sh && \
    echo 'set -x' >> /home/jekylluser/start.sh && \
    echo 'source $HOME/.bashrc' >> /home/jekylluser/start.sh && \
    echo 'echo "Ruby version: $(ruby -v)"' >> /home/jekylluser/start.sh && \
    echo 'echo "Jekyll version: $(jekyll -v)"' >> /home/jekylluser/start.sh && \
    echo 'echo "Bundler version: $(bundle -v)"' >> /home/jekylluser/start.sh && \
    echo 'echo "Webrick version: $(gem list webrick)"' >> /home/jekylluser/start.sh && \
    echo 'echo "Gem environment:"' >> /home/jekylluser/start.sh && \
    echo 'gem env' >> /home/jekylluser/start.sh && \
    echo 'echo "Current directory: $(pwd)"' >> /home/jekylluser/start.sh && \
    echo 'echo "Directory permissions:"' >> /home/jekylluser/start.sh && \
    echo 'ls -ld .' >> /home/jekylluser/start.sh && \
    echo 'echo "Directory contents:"' >> /home/jekylluser/start.sh && \
    echo 'ls -la' >> /home/jekylluser/start.sh && \
    echo 'if [ ! -f Gemfile ]; then' >> /home/jekylluser/start.sh && \
    echo '  echo "No Gemfile found, initializing a new Jekyll site..."' >> /home/jekylluser/start.sh && \
    echo '  jekyll new . --force 2>&1 || { echo "jekyll new failed with error: $?"; exit 1; }' >> /home/jekylluser/start.sh && \
    echo '  echo "Gemfile contents after jekyll new:"' >> /home/jekylluser/start.sh && \
    echo '  cat Gemfile || echo "Gemfile not found"' >> /home/jekylluser/start.sh && \
    echo '  bundle install 2>&1 || { echo "bundle install failed with error: $?"; exit 1; }' >> /home/jekylluser/start.sh && \
    echo 'fi' >> /home/jekylluser/start.sh && \
    echo 'echo "Running bundle exec jekyll serve..."' >> /home/jekylluser/start.sh && \
    echo 'bundle exec jekyll serve --host 0.0.0.0 --incremental 2>&1 || { echo "jekyll serve failed with error: $?"; exit 1; }' >> /home/jekylluser/start.sh && \
    chmod +x /home/jekylluser/start.sh

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Add health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost:4000/ || exit 1

# Use the start script to ensure a Gemfile exists
CMD ["/bin/bash", "-c", "/home/jekylluser/start.sh"]