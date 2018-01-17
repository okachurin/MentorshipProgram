#!/bin/bash
aws ec2 run-instances --image-id $INSTANCEAMI \
--count 1 \
--instance-type $INSTANCETYPE \
--key-name $INSTANCEKEY \ 
--security-groups $SECURITYGROUP \
--tag-specifications 'ResourceType=instance,Tags=[{$TAG1},{$TAG2}]' 
