#!/usr/bin/env bash

DOCKER=docker
type docker >/dev/null 2>&1 || export DOCKER=/usr/bin/docker

tag=$1

if [ -z ${tag} ]; then
    echo tag must be given
    exit 1
fi

dockerRegistry=mcsdevopsentarch
retryCount=3

tryPushImage(){
    image=$1
    tries=${retryCount}

    while [ ${tries} -gt 0 ]; do
        echo ${DOCKER} push ${image}
        ${DOCKER} push ${image}

        if [ $? -eq 0 ]; then
            return 0
        fi
        echo ${DOCKER} push ${image} failed
        ((tries--))
        if [ ${tries} -gt 0 ]; then
            sleep 10
        fi
    done
    return 1
}

main(){
    docker tag ${tag} ${dockerRegistry}/${tag}
    dockerImageFullName=${dockerRegistry}/${tag}
    echo "finding images: '${dockerImageFullName}'"

    images=($(docker images | grep ${dockerImageFullName} | awk '{printf "%s:%s\n", $1, $2}'))

    echo found these images:
    echo ${images[@]}

    for image in ${images[@]}; do
        tryPushImage ${image} || exit 1
    done
}

main
