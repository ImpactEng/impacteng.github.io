FROM ruby:3-slim

# Install dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
build-essential git libssl-dev libreadline-dev zlib1g-dev curl \
libffi-dev libyaml-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Install rbenv
ENV RBENV_ROOT=/root/.rbenv
ENV PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash && \
echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# Install Ruby (GitHub Pages compatible)
RUN rbenv install 3.3.4 && rbenv global 3.3.4

# Set working directory
WORKDIR /app

# Copy dependency files
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler -v '2.6' && \
bundle config set --local without 'development test' && \
bundle install --jobs 4 --retry 3

# Expose port for Jekyll server
EXPOSE 4000

# Serve from sitefiles directory
CMD ["bundle", "exec", "jekyll", "serve", "--source", "sitefiles", "--destination", "sitefiles/_site", "--host", "0.0.0.0", "--port", "4000", "--livereload"]