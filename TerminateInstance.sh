#!/bin/bash
aws ec2 describe-instances \
--filters "Name=tag-key,Values=APPLICATION" "Name=instance-state-code,Values=16" \
--query 'Reservations[*].Instances[*].[InstanceId]' \
--output text |
while read line;
do aws ec2 terminate-instances --instance-ids  $line
done
