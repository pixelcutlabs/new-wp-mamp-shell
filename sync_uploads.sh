#!/bin/sh
# sync_uploads.sh v0.0.1
# Run this from your site root, i.e. ~/Sites/example/

clear
cd ~/Sites
printf "Enter your TS VPS username: (i.e. john)"
read USERNAME
printf "Enter the applicable server nickname: (i.e. dev)"
read SERVERNAME
printf "What is the domain name for the site? (i.e. example.com) "
read DOMAINNAME

sudo rsync -auvz -e 'ssh -p 4444' --progress $USERNAME@$SERVERNAME.tribeswell.com:/var/www/$DOMAINNAME/htdocs/wp-content/uploads/* wp-content/uploads/