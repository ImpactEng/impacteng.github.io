#!/bin/bash
# Shared htmlproofer invocation. Single source of truth for the ignore-urls list.
# Called by scripts/test.sh (local pre-push, inside the jekyll docker container)
# and by .github/workflows/ci.yml (on the GitHub Actions runner).
set -e

bundle exec htmlproofer ./_site \
  --checks "Links,Images,Scripts,Html" \
  --allow-hash-href \
  --ignore-urls "/impacteng\.com\.au/,/linkedin\.com/,/twitter\.com/,/x\.com/,/formspree\.io/,/use\.fontawesome\.com/,/devpost\.com/"
