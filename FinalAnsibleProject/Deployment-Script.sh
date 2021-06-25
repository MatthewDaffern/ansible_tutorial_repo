#!/bin/bash

virt-clone --original template --name CentOS-1 --file /home/qemu_daemon/storage/CentOS-1.qcow2;
virsh start CentOS-1
CentOS_clone=1
echo -n "waiting for Template ..."
while (($CentOS_clone == 1))
do
   if ping -c 1 -w 1 192.168.8.1 &> /dev/null
   then
      echo "Template is online"
      CentOS_clone=0
   else
      echo -n "waiting... "
   fi
done
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-1.sh;
virt-clone --original template --name CentOS-2 --file /home/qemu_daemon/storage/CentOS-2.qcow2;
virsh start CentOS-2
CentOS_clone=1
echo -n "waiting for Template ..."
while (($CentOS_clone == 1))
do
   if ping -c 1 -w 1 192.168.8.1 &> /dev/null
   then
      echo "Template is online"
      CentOS_clone=0
   else
      echo -n "waiting... "
   fi
done
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-2.sh;
virt-clone --original template --name CentOS-3 --file /home/qemu_daemon/storage/CentOS-3.qcow2;
virsh start CentOS-3
CentOS_clone=1
echo -n "waiting for Template ..."
while (($CentOS_clone == 1))
do
   if ping -c 1 -w 1 192.168.8.1 &> /dev/null
   then
      echo "Template is online"
      CentOS_clone=0
   else
      echo -n "waiting... "
   fi
done
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-3.sh;
virt-clone --original template --name CentOS-4 --file /home/qemu_daemon/storage/CentOS-4.qcow2;
virsh start CentOS-4CentOS_clone=1
echo -n "waiting for Template ..."
while (($CentOS_clone == 1))
do
   if ping -c 1 -w 1 192.168.8.1 &> /dev/null
   then
      echo "Template is online"
      CentOS_clone=0
   else
      echo -n "waiting... "
   fi
done
ssh-copy-id root@192.168.8.1;
ssh root@192.168.8.1 'bash -s' < CentOS-4.sh;