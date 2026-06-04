#!/bin/bash
set -e

echo "Building site for GitHub Pages compatibility..."
docker compose run --rm jekyll bundle exec jekyll build

echo "Validating breadcrumb schema..."
python3 scripts/validate_breadcrumb_schema.py

echo "Checking links and images (matches CI, includes external links)..."
docker compose run --rm jekyll bash scripts/htmlproofer.sh

echo "Tests passed!"
