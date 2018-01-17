#!/bin/bash
aws ec2 run-instances --image-id $INSTANCE_AMI \
--count 1 \
--instance-type $INSTANCE_TYPE --key-name $INSTANCE_KEY \ 
--security-groups $SECURITY_GROUP \
--tag-specifications 'ResourceType=instance,Tags=[{$TAG1},{$TAG2}]' 
