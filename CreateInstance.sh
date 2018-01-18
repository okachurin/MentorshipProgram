#!/bin/bash
aws ec2 run-instances --image-id $INSTANCEAMI \
--count 1 \
--instance-type $INSTANCETYPE --key-name $INSTANCEKEY \
--security-group-ids $SECURITYGROUP \
--tag-specifications 'ResourceType=instance,Tags=[{Key="APPLICATION",Value="TOMCAT"}]' |
while [ "aws ec2 describe-instances --filters "Name=tag-key,Values=APPLICATION" "Name=instance-state-code,Values=16"" ]
do
echo "Instance up and Running"
done
