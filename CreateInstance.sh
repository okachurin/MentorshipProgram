#!/bin/bash
aws ec2 run-instances --image-id ami-df8406b0 \
 --count 1 \
 --instance-type $TYPE --key-name WINDOWS-SERVER \ 
 --security-groups launch-wizard-2 \
 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=SLAVE},{Key=APPLICATION,Value=Tomcat}]' 
