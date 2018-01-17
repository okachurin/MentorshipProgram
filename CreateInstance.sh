#!/bin/bash
aws ec2 run-instances --image-id ami-df8406b0 \
 --count 1 \
 --instance-type $INSTANCETYPE --key-name WINDOWS-SERVER \ 
 --security-group-ids $SECURITYGROUP \
 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=SLAVE},{Key=APPLICATION,Value=Tomcat}]' 
