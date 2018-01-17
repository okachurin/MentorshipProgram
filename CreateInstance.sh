#!/bin/bash
aws ec2 run-instances --image-id $INSTANCEAMI \
--count 1 \
--instance-type $INSTANCETYPE \
--security-groups launch-wizard-2 \
--key-name $INSTANCEKEY \ 
--tag-specifications 'ResourceType=instance,Tags=[{$TAG1},{$TAG2}]' 
