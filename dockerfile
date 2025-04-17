# Stage 1: Build stage
FROM ruby:3.4-slim AS builder

# Install build dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential git libssl-dev libreadline-dev zlib1g-dev curl \
    libffi-dev libyaml-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up rbenv
ENV RBENV_ROOT=/usr/local/rbenv
ENV PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
RUN git clone --depth 1 --branch v1.3.2 https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    git clone --depth 1 --branch v20250415 https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build && \
    echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# Install Ruby 3.3.0 (pinned version)
RUN rbenv install 3.4.3 && rbenv global 3.4.3

# Install Jekyll and Bundler with pinned versions
RUN gem install jekyll -v 4.4.1 && gem install bundler -v 2.6.8

# Stage 2: Final stage
FROM ruby:3.4-slim

# Install runtime dependencies only
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy rbenv and Ruby from builder stage
ENV RBENV_ROOT=/usr/local/rbenv
ENV PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
COPY --from=builder $RBENV_ROOT $RBENV_ROOT
COPY --from=builder /etc/profile.d/rbenv.sh /etc/profile.d/rbenv.sh

# Create a non-root user
RUN useradd -m -u 1000 jekylluser && \
    mkdir -p /app && \
    chown -R jekylluser:jekylluser /app

# Switch to non-root user
USER jekylluser

# Set working directory
WORKDIR /app

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Add health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost:4000/ || exit 1

# Use a shell to ensure rbenv is initialized
CMD ["/bin/bash", "-c", "source /etc/profile.d/rbenv.sh && jekyll serve --host 0.0.0.0"]