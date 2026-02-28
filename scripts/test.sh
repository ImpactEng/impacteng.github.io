#!/bin/bash
set -e

echo "Building site for GitHub Pages compatibility..."
docker compose run --rm jekyll bundle exec jekyll build

echo "Checking internal links and images..."
docker compose run --rm jekyll bundle exec htmlproofer ./_site \
  --checks "Links,Images,Scripts" \
  --allow-hash-href \
  --disable-external

echo "Tests passed!"
