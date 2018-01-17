#!/bin/bash
aws ec2 run-instances --image-id $INSTANCE-AMI \
--count 1 \
--instance-type $INSTANCE-TYPE --key-name $INSTANCE-KEY \ 
--security-groups $SECURITY-GROUP \
--tag-specifications 'ResourceType=instance,Tags=[{$TAG1},{$TAG2}]' 
