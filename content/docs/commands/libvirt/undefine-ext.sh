#!/bin/bash
# Give VM a chance to gracefully shutdown
virsh shutdown testvm
sleep 1

virsh destroy testvm
virsh undefine --remove-all-storage --nvram testvm
ssh-keygen -R testvm
