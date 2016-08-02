sudo yum update -y;
# you can change the version numbers below (aws' repo has various httpd/php/mysql versions available)
sudo yum install -y httpd24 php56 mysql55-server php56-mysqlnd;
sudo service httpd start;
sudo chkconfig httpd on;
sudo groupadd www;
sudo usermod -a -G www ec2-user;
sudo chown -R root:www /var/www;
sudo chmod 2775 /var/www;
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo service mysqld start;
sudo mysql_secure_installation
sudo service mysqld stop;
sudo service mysqld start;
sudo chkconfig mysqld on;
# you can stop here if you dont want to install phpmyadmin
sudo yum-config-manager --enable epel;
sudo yum install -y phpMyAdmin;
#change the following line to match the IP you want allowed access to phpmyadmin (or remove that line from the conf entirely)
sudo sed -i -e 's/127.0.0.1/##.##.##.##/g' /etc/httpd/conf.d/phpMyAdmin.conf;
sudo service httpd restart;
