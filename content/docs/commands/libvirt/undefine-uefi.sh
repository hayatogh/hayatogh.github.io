#!/bin/bash
virsh destroy testvm
virsh undefine --remove-all-storage --nvram testvm
ssh-keygen -R testvm
