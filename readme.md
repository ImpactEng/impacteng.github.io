
## Build and run:

```shell
docker-compose up --build
```

 **Rebuild Without Cache**:

If the build is corrupted, rebuild without cache:

```shell
docker-compose down --remove-orphans
docker rmi $(docker images -q jekyll) 2>/dev/null
docker-compose build --no-cache
docker-compose up --build
```

## Workflow Overview

* Local Development:
    * Use Docker with rbenv to run a Jekyll environment, configured to use the sitefiles folder as the source.
    * Preview the site locally with live reloading.
* Testing:
    * Validate the site build for GitHub Pages compatibility from the sitefiles folder.
    * Check for broken links and HTML errors.
* Deployment:
    * Push changes to a GitHub repository.
    * Use GitHub Actions to build the site from sitefiles and deploy to GitHub Pages.
* Maintenance:
    * Update dependencies securely.
    * Monitor for vulnerabilities.