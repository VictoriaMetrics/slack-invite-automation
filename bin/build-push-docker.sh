#!/usr/bin/env bash
set -x -e
cd "$(dirname "$0")/.."

VERSION="0.3.5-hsts"
LOCAL_TAG="slack-invite-automation:latest"
REMOTE_TAG="us-docker.pkg.dev/victoriametrics-test/default/slack-invite-automation:$VERSION"

export DOCKER_BUILDKIT=1
docker build -t "$LOCAL_TAG" --network=host .

docker tag "$LOCAL_TAG" "$REMOTE_TAG"
docker push $REMOTE_TAG
