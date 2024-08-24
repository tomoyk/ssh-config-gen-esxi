#!/bin/bash

# SSH password for VMware ESXi
ESXI_HOST="x.x.x.x"
ESXI_USER="root"
ESXI_PASSWORD="REPLACE ME"

# Init ssh config file
echo -n > ~/.ssh/config.gen

sshpass -p ${ESXI_PASSWORD} ssh ${ESXI_USER}@${ESXI_HOST} 'vim-cmd vmsvc/getallvms' | while read line
do
	# echo $line
	vmid=$(echo $line | awk '{print $1}')
	vmname=$(echo $line | awk '{print $2}')
	cmd="vim-cmd vmsvc/get.summary $vmid | grep ipAddress"
	# echo "cmd: $cmd"
	ipaddr=$(sshpass -p ${ESXI_PASSWORD} ssh -n ${ESXI_USER}@${ESXI_HOST} $cmd | grep -o '[0-9.]\+')

	echo "Host $vmname
	Hostname $ipaddr" >> ~/.ssh/config.gen
done
