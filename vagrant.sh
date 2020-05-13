#!/bin/bash
#######################################
#   Vagant CentOS VM creation script  #
#######################################
#   Created by Kirill Rudenko         #
#######################################

function pre_condition(){
    PACKAGE_NAME="vagrant"
    #system requirenments pre-check
    if [ -f /usr/bin/vagrant ]; then
    	#stress utility is already installed
    	echo "Vagrant is already installed"
    	echo "Will proceed with VM setup"
    elif
    	cat /etc/*release | grep ^NAME | grep CentOS; then
        echo "==============================================="
        echo "Installing package $PACKAGE_NAME on CentOS"
        echo "==============================================="
        nohup sudo yum update -y > /dev/null 2>&1
        nohup sudo yum install -y $PACKAGE_NAME > /dev/null 2>&1        
     elif cat /etc/*release | grep ^NAME | grep Red; then
        echo "==============================================="
        echo "Installing package $PACKAGE_NAME on RedHat"
        echo "==============================================="
        nohup sudo yum update -y > /dev/null 2>&1
        nohup sudo yum install -y $PACKAGE_NAME > /dev/null 2>&1        
     elif cat /etc/*release | grep ^NAME | grep Fedora;  then
        echo "================================================" 
        echo "Installing package $PACKAGE_NAME on Fedora"
        echo "================================================"
        nohup sudo yum update -y > /dev/null 2>&1
        nohup sudo yum install -y $PACKAGE_NAME > /dev/null 2>&1        
     elif cat /etc/*release | grep ^NAME | grep Ubuntu;  then
        echo "==============================================="
        echo "Installing package $PACKAGE_NAME on Ubuntu"
        echo "==============================================="
        nohup sudo apt-get update > /dev/null 2>&1
        nohup sudo apt-get install -y $PACKAGE_NAME > /dev/null 2>&1         
     elif cat /etc/*release | grep ^NAME | grep Debian ;  then
        echo "==============================================="
        echo "Installing package $PACKAGE_NAME on Debian"
        echo "==============================================="
        nohup sudo apt-get update > /dev/null 2>&1
        nohup sudo apt-get install -y $PACKAGE_NAME > /dev/null 2>&1         
     else
        echo "OS NOT DETECTED, couldn't install package $PACKAGE_NAME"
        exit 1;
     fi
}

function vm_up(){
    #main part goes here
    echo "==============================================="
    echo "Let me create your first Vagrant VM now..."
    echo "==============================================="    
    mkdir vagrant
    cd vagrant/
    mkdir centos_vm
    cd centos_vm/
    echo "==============================================="
    echo "Vagrant directory has been created"
    echo "Please wait untill I will create the box"
    echo "==============================================="
    vagrant box add generic/centos7
    echo "==============================================="
    echo "It is done. Let's provision your first VM"
    echo "Please hold on.."
    echo "==============================================="
    vagrant init centos/7
    echo "==============================================="
    echo "Done. Let me make it alive!"
    echo "==============================================="
    vagrant up
    echo "==============================================="
    echo "VM is alive"
    echo "Use 'vagrant ssh' command to access it"
    echo "For additional info do 'vagrant help'"
    echo "Or visit https://www.vagrantup.com/docs/"
}

function main(){
    pre_condition
    vm_up
}

main
