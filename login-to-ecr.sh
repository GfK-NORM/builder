#!/bin/bash
set -e
account_id=$(aws sts get-caller-identity --output text | awk '{print $1}')
aws ecr get-authorization-token \
    --region eu-west-1 \
    --output text \
    --query 'authorizationData[].authorizationToken' | \
  base64 -d | \
  cut -d: -f2 | \
  docker login \
    --password-stdin \
    --username AWS https://${account_id}.dkr.ecr.eu-west-1.amazonaws.com