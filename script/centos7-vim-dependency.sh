#!/bin/bash

yum install -y https://centos7.iuscommunity.org/ius-release.rpm &&\
yum install -y python36 &&\
ln -s /usr/bin/python3.6 /usr/bin/python3 &&\
yum -y install python-pip &&\
python3 -m ensurepip &&\
pip2 install neovim &&\
pip3 install neovim &&\
yum -y install neovim
