#!/bin/bash

# create group named 'mygroup'
sudo groupadd -g 19001 mygroup

# create alice user
sudo useradd -u 20001 -m alice -s /bin/bash
# set static password and ensure group definition added to /etc/group
phash=$(openssl passwd -1 -salt mysalt alicepass)
sudo usermod -p "$phash" -G mygroup alice

# create bob user
sudo useradd -u 20002 -m bob -s /bin/bash
# set static password and ensure group definition added to /etc/group
phash=$(openssl passwd -1 -salt mysalt bobpass)
sudo usermod -p "$phash" -G mygroup bob 

