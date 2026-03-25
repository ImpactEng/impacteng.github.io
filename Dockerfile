FROM ruby:3.3-slim

# Install dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
build-essential git libssl-dev libreadline-dev zlib1g-dev curl \
libffi-dev libyaml-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependency files
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler -v '2.6' && \
bundle install --jobs 4 --retry 3

# Expose port for Jekyll server
EXPOSE 4000

# Start Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload"]
