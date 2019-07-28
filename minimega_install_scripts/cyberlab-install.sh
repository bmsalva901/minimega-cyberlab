#!/bin/bash/

#Deploys minimega, and of its dependencies and more extra apt packes for later use.
bash .minimega-deploy-01.sh

#Connects the minimega bridge (mega_bridge) to the active network interface
#This also avoids losig connectivity of ssh shell
bash .bridge-config-02.sh

#Downloads virtual machines from various sources, depackages, converts them to qcow2 and removes unwanted leftover files
bash .download-vms-03.sh 

#Initialized the cyberLab for the first time. Only run this command on first install of you are starting from scratch.
bash .initial-cyberlab-start-04.sh
