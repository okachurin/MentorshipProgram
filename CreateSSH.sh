#!/bin/bash
sudo scp -o StrictHostKeyChecking=no -i /home/ubuntu/.ssh/WINDOWS-SERVER.pem /var/lib/jenkins/.ssh/id_rsa.pub ubuntu@$IP:
sudo ssh -o StrictHostKeyChecking=no -i  /home/ubuntu/.ssh/WINDOWS-SERVER.pem ubuntu@$IP 'cat id_rsa.pub >> ~/.ssh/authorized_keys'
ssh-keyscan $IP >> /var/lib/jenkins/.ssh/known_hosts

sed -i 's/ansibleip/'$IP'/g' instanceip.txt
