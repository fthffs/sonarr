#!/usr/bin/env bash

sonarr() {
  sonarr_url="https://services.sonarr.tv/v1/releases"
  sonarr_channel="v4-stable"
  local new_version=$(curl -sSL ${sonarr_url} | jq -r "first(.[] | select(.releasechannel==\"${sonarr_channel}\") | .version)")

  if [ "${new_version}" ]; then
    sed -i "s/SONARR_VERSION=.*/SONARR_VERSION=${new_version}/" Dockerfile
  fi

  if output=$(git status --porcelain) && [ -z "$output" ]; then
    # working directory clean
    echo "no new sonarr version available!"
  else
    # uncommitted changes
    git commit -a -m "updated sonarr to version: ${new_version}"
    git push
  fi
}

sonarr
