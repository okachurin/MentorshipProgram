#!/bin/bash
aws ec2 run-instances --image-id $INSTANCEAMI \
--count 1 \
--instance-type $INSTANCETYPE --key-name $INSTANCEKEY \
--security-group-ids $SECURITYGROUP \
--tag-specifications 'ResourceType=instance,Tags=[{Key=$TAGKEY,Value=$TAGVALUE}' 
