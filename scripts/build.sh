#!/bin/bash
source ../deploy-envs.sh

#AWS_ACCOUNT_NUMBER={} set in private variable
export AWS_ECS_REPO_DOMAIN=$AWS_ACCOUNT_NUMBER.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com

# replace values in our config file
sed "s/AWS_ECS_CLUSTER_NAME/$AWS_ECS_CLUSTER_NAME/;s/AWS_VIRTUAL_HOST/$AWS_VIRTUAL_HOST/;s/AWS_DEFAULT_REGION/$AWS_DEFAULT_REGION/" traefik_ecs.toml > traefik.toml

# Build process
docker build -t $IMAGE_NAME ../
docker tag $IMAGE_NAME $AWS_ECS_REPO_DOMAIN/$IMAGE_NAME:$IMAGE_VERSION
