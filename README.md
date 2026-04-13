# impacteng.github.io

Source for [impacteng.com.au](https://impacteng.com.au) — a Jekyll static site hosted on GitHub Pages.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Compose v2)

No local Ruby installation is required.

## Local Development

Start the Jekyll dev server with live reload:

```shell
./scripts/serve.sh
```

Site is available at **http://localhost:4000**. Files sync into the container automatically; the browser reloads on save.

First run (or after changing the `dockerfile` or `Gemfile`) builds the image:

```shell
docker compose build
```

**Rebuild without cache** (if the build is corrupted):

```shell
docker compose down --remove-orphans
docker compose build --no-cache
```

## Testing

Run the full test suite (Jekyll build + internal link and image checks):

```shell
./scripts/test.sh
```

The CI workflow (`.github/workflows/ci.yml`) runs the same build plus external link checks on every push and pull request.

## Adding a Blog Post

1. Create a file in `_posts/` named `YYYY-MM-DD-your-post-title.md`
2. Include this front matter:

```yaml
---
layout: post
title: Your Post Title
description: One-sentence summary for SEO and social sharing.
permalink: /blog/your-post-title/
author: Nitin Sharma
tags: [cloud, devops, strategy]
---
```

3. Add `<!--more-->` after the first paragraph to set the excerpt shown on the blog listing page.

## Updating Dependencies

Update Ruby gems conservatively and audit for vulnerabilities:

```shell
./scripts/update-deps.sh
```

Dependabot also raises weekly PRs for gem and GitHub Actions updates automatically.

## Deployment

Push to the `gh-pages` branch. GitHub Pages builds and deploys the site automatically.

The CI workflow runs on every push to `main` and `gh-pages` and on all pull requests targeting `main`.

## Project Structure

```
_posts/          Blog posts (Markdown)
_layouts/        Page templates (default, post, page, home)
_includes/       Reusable template partials
_sass/           SCSS stylesheets
assets/          Images, JS, compiled CSS
scripts/         serve.sh, test.sh, update-deps.sh
.github/
  workflows/     ci.yml, dependency-review.yml
  dependabot.yml Weekly dependency update config
patches/         Reference diffs documenting theme customisations
.well-known/     security.txt
_config.yml      Site configuration
dockerfile       Docker image definition (ruby:3.3.4-slim)
docker-compose.yml
```
