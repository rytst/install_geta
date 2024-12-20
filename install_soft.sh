#/bin/bash

## Gunma Univ. soft2/soft3 development environment
## Copyright(C) 2023 M. Yasukawa <yasukawa@gunma-u.ac.jp>
## ver.20231025

cd /tmp

wget --quiet http://cookbook.inf.gunma-u.ac.jp/data/soft2.tgz
wget --quiet http://cookbook.inf.gunma-u.ac.jp/data/soft3.tgz

/bin/rm -rf /usr/local/soft2

tar xzf soft3.tgz -C ${HOME}
tar xzf soft2.tgz -C /usr/local

## logfile
logfile="install_soft.log"
/bin/rm -rf ${logfile}

echo "====== apt update ======" >>${logfile} 2>&1
apt update >>${logfile} 2>&1
echo "====== apt-get -y install build-essential ======" >>${logfile} 2>&1
apt-get -y install build-essential >>${logfile} 2>&1
echo "====== add-apt-repository ======" >>${logfile} 2>&1
add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) universe" >>${logfile} 2>&1
apt clean >>${logfile} 2>&1
echo "====== apt update ======" >>${logfile} 2>&1
apt update >>${logfile} 2>&1
echo "====== apt-get -y install  ======" >>${logfile} 2>&1
apt-get -y install zip unzip gzip nkf mecab chasen >>${logfile} 2>&1
echo "====== add-apt-repository --remove ======" >>${logfile} 2>&1
add-apt-repository --remove "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) universe" >>${logfile} 2>&1
apt clean >>${logfile} 2>&1

/bin/rm -rf soft2.tgz* soft3.tgz*
/bin/rm -rf ${logfile}

/usr/local/soft2/.config/INSTALL.sh
