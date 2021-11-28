#! /bin/sh

CURRENT_DIR=`pwd`
UID=`id -u`
VARIANTS="debian"

IMAGE='git-crypt'
for v in $VARIANTS
do
  docker build -t ${IMAGE}:${v} -f docker/${v}.Dockerfile .
done


# Export artifacts
rm -rf dist/*

for v in $VARIANTS
do
  docker run -u ${UID} --rm -v "${CURRENT_DIR}/dist:/dist" ${IMAGE}:${v} sh -c "cp /tmp/build/git-crypt /dist/git-crypt.${v}"
done
