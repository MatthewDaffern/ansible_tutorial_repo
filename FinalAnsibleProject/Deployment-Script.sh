#!/bin/bash

virt-clone --original template --name CentOS-1 --file /home/qemu_daemon/storage/CentOS-1.qcow2;
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-1.sh;
virt-clone --original template --name CentOS-2 --file /home/qemu_daemon/storage/CentOS-2.qcow2;
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-2.sh;
virt-clone --original template --name CentOS-3 --file /home/qemu_daemon/storage/CentOS-3.qcow2;
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-3.sh;
virt-clone --original template --name CentOS-4 --file /home/qemu_daemon/storage/CentOS-4.qcow2;
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-4.sh;