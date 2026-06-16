#!/bin/bash
# Give VM a chance to gracefully shutdown
# virsh shutdown testvm
# sleep 3

virsh destroy testvm
virsh undefine --remove-all-storage testvm
ssh-keygen -R testvm
