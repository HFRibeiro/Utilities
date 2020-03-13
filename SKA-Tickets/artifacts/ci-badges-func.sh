#!/bin/bash

export CI_COMMIT_SHA=1
export CI_PROJECT_ID=2
export CI_DEFAULT_BRANCH=3

mkdir build/badges

curl https://gitlab.com/ska-telescope/ci-metrics-utilities/raw/master/scripts/collect_metrics.py | python3
curl https://gitlab.com/ska-telescope/ci-metrics-utilities/raw/master/scripts/create_badges.py | python3

# Upload badges and metrics to master folder
find build/badges -type f -exec curl --user code:lar --upload-file {} . \;
find build/reports -type f -exec curl --user code:lar --upload-file {} . \;

# Upload badges and metrics to sha folder
find build/badges -type f -exec curl --user code:lar --upload-file {} . \;
find build/reports -type f -exec curl --user code:lar --upload-file {} . \;
