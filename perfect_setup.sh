#!/bin/sh
clear
cd ~/Sites
printf "What is your BitBucket username? "
read BBUSERNAME
printf "What is the name of the BitBucket repo (i.e. perfect-setup or example-site)? "
read BBREPO
printf "What should the directory be called on your system? This should be another BitBucket repo name. Press return/enter for the default. (default $BBREPO)? "
read NEWDIR
NEWDIR=${NEWDIR:-$BBREPO}
git clone https://$BBUSERNAME@bitbucket.org/tribeswell-llc/$BBREPO.git $NEWDIR
cd $NEWDIR
git remote set-url origin https://$BBUSERNAME@bitbucket.org/tribeswell-llc/$BBREPO.git
git remote add upstream https://$BBUSERNAME@bitbucket.org/tribeswell-llc/perfect-setup.git
echo "" && echo "Remotes set successfully!" && echo ""
git remote -v && echo ""
printf "What would you like to name your new database (i.e. example_site)? "
read NEWDB
printf "Create a strong password for this database: "
read -s MYSQLPWD

echo ""
/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot -e "CREATE USER '$NEWDB'@'localhost' IDENTIFIED BY '$MYSQLPWD'; CREATE DATABASE $NEWDB; GRANT ALL ON $NEWDB.* TO '$NEWDB'@'localhost';"

/Applications/MAMP/Library/bin/mysql --host=localhost -u$NEWDB -p$MYSQLPWD $NEWDB < ./perfect_setup.sql

if [ -f ./wp-config.php ]
then
echo "" && echo "There appears to be a wp-config.php file already." && open http://$NEWDIR:7888/wp/wp-admin/install.php
else
cp -n ./wp-config-sample.php ./wp-config.php
SECRETKEYS=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
EXISTINGKEYS='put your unique phrase here'
printf '%s\n' "g/$EXISTINGKEYS/d" a "$SECRETKEYS" . w | ed -s ./wp-config.php
WPHOME=$"wp_home_here"
DBUSER=$"username_here"
DBPASS=$"password_here"
DBNAME=$"database_name_here"
sed -i'' -e "s/${WPHOME}/http:\/\/${NEWDIR}:7888/g" ./wp-config.php
sed -i'' -e "s/${DBUSER}/${NEWDB}/g" ./wp-config.php
sed -i'' -e "s/${DBPASS}/${MYSQLPWD}/g" ./wp-config.php
sed -i'' -e "s/${DBNAME}/${NEWDB}/g" ./wp-config.php
echo "" && echo "Success!" && open http://$NEWDIR:7888/wp/wp-admin/
fi