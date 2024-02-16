sudo apt update -y
sudo apt upgrade -y
sudo apt install -y apache2 mysql-server mysql-client php
sudo apt install -y debconf-utils
export DEBIAN_FRONTEND=noninteractive
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password garik123" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password garik123" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password garik123" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
sudo apt-get install -y phpmyadmin
mysql -p=garik123 -u "root" -Bse "CREATE USER 'garik'@'localhost' IDENTIFIED BY 'garik123'";
mysql -p=garik123 -u "root" -Bse "GRANT ALL PRIVILEGES ON *.* TO 'garik'@'localhost' WITH GRANT OPTION";
mysqladmin -u garik -p garik123 create info
sudo rm /var/www/html/index.html
sudo apt-get install -y git
sudo git clone https://github.com/saikatbsk/TODO.git
sudo mv ./TODO/* /var/www/html/
sed -i s/saikat/garik/g /var/www/html/dbconnect.php
sed -i s/ppioneer/garik123/g /var/www/html/dbconnect.php
sed -i s/todo_db/info/g /var/www/html/dbconnect.php
sudo apache2ctl restart
sudo apt install curl
curl 127.0.0.1/install.php
