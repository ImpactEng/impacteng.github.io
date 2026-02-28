#!/bin/bash
echo "Updating Ruby gems..."
docker compose run --rm jekyll bundle update --conservative
docker compose run --rm jekyll bundle audit check --update

echo "Rebuilding Docker image..."
docker compose build