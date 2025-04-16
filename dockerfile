# Use the latest official Ruby image
FROM ruby:latest

# Install dependencies for rbenv and Jekyll
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    git \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install rbenv
ENV HOME /root
ENV RBENV_ROOT $HOME/.rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
RUN git clone https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build

# Install the latest Ruby version via rbenv (same as base image for consistency)
RUN rbenv install $(rbenv install -l | grep -v - | tail -1) && \
    rbenv global $(rbenv install -l | grep -v - | tail -1)

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Set working directory
WORKDIR /app

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Default command to start Jekyll server
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
