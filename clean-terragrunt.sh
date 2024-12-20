# Clean up for local terragrunt caches
# will clean up all lock folders and caches

find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
find . -type f -name ".terraform.lock.hcl" -prune -exec rm -f {} \;