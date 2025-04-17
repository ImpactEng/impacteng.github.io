
## Build and run:

```shell
docker-compose up --build
```

## Create a new Jekyll site

```shell
docker-compose exec jekyll jekyll new .
```

## Security Features

* Slim Base Image: Uses `ruby:3.3-slim` to minimize the attack surface.
* Non-Root User: Runs as `jekylluser` (UID 1000) to reduce privilege escalation risks.
* Pinned Versions: Locks Ruby (3.3.0), Jekyll (4.3.3), Bundler (2.5.3), and `rbenv`/`ruby-build` to specific versions to prevent supply chain attacks.
* Multi-Stage Build: Separates build and runtime dependencies to reduce image size.
* Minimal Dependencies: Installs only necessary packages and cleans up caches.
* Health Check: Monitors the Jekyll server to ensure it’s running correctly.
* Shallow Git Clones: Reduces image size by limiting Git history.

