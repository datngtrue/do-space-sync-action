#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${SPACE_ACCESS_KEY_ID}
aws_secret_access_key = ${SPACE_SECRET_ACCESS_KEY}" > ~/.aws/credentials


echo $*
env | cat
ls -lah ${SOURCE_DIR}

aws s3 sync ${SOURCE_DIR} s3://${SPACE_NAME} \
            --follow-symlinks \
            --delete \
            --endpoint https://${SPACE_REGION}.digitaloceanspaces.com $*

rm -rf ~/.aws
