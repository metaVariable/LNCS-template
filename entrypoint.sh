#!/bin/bash
set -eux

GITHUB_REPOSITORY=${GITHUB_REPOSITORY:-"undefined"}

TARGET=${TARGET:-"main.pdf"}

# create release
res=`curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://api.github.com/repos/${GITHUB_REPOSITORY}/releases \
-d "
{
  \"tag_name\": \"v$GITHUB_SHA\",
  \"target_commitish\": \"$GITHUB_SHA\",
  \"name\": \"v$GITHUB_SHA\",
  \"draft\": false,
  \"prerelease\": false
}"`

# extract release id
rel_id=`echo ${res} | python3 -c 'import json,sys;print(json.load(sys.stdin)["id"])'`

# upload built pdf
curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${rel_id}/assets?name=${TARGET}\
  --header 'Content-Type: application/pdf'\
  --upload-file ${TARGET}
