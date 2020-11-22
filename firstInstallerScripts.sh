#yüklenmesi gereken programlar 
opera, ulauncher, 


#Php (latest)

echo '#####################################################'
echo 'updating system repositories'
echo '#####################################################'
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt update

echo '#####################################################'
echo 'install latest php & extensions from snap'
echo '#####################################################'
sudo apt-get install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath libapache2-mod-php php-curl php-pear php-imagick php-mcrypt php-ps php-pspell php-recode -y

# Apache
echo '#####################################################'
echo 'installing & starting apache service'
echo '#####################################################'
sudo apt install apache2
sudo chown -R www-data:www-data /var/www
sudo service apache2 restart

# Mysql8
echo '#####################################################'
echo 'installing & starting mysql 8 service'
echo '#####################################################'
sudo apt-get install wget zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb 
sudo apt update
sudo apt install mysql-server mysql-client libmysqlclient15.dev -y

# Create new mysql user
echo '#####################################################'
echo 'creating new mysql user'
echo '#####################################################'
set -e
read -e "Username: ' username
read -e "Password: ' password

sudo mysql -uroot <<MYSQL_SCRIPT
CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';
GRANT ALL PRIVILEGES ON username.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   $username"
echo "Password:   $password"


# Permissions
echo '#####################################################'
echo 'setting php service and extensions on apache2'
echo '#####################################################'
sudo chown -R www-data:www-data /var/www
sudo a2enmod rewrite
sudo php7.4enmod mcrypt
sudo service apache2 restart


# PhpMyAdmin
echo '#####################################################'
echo 'install phpmyadmin - this step may need user interaction'
echo '#####################################################'
sudo apt-get install phpmyadmin -y


# Insomnia
echo '#####################################################'
echo 'install insomnia and postman'
echo '#####################################################'
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install insomnia
sudo snap install postman

# Node_12
echo '#####################################################'
echo 'install nodejs 12'
echo '#####################################################'
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs


# Virtualbox
echo '#####################################################'
echo 'install virtualbox'
echo '#####################################################'
sudo apt-get install software-properties-common
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
echo  'A good idea would be to type sudo apt install virtualbox– and hit tab to see the various VirtualBox versions available for installation ' 
echo ' then select one of them by typing it completely'.
sudo apt install virtualbox

# ImageMagick
echo '#####################################################'
echo 'install imagemagick'
echo '#####################################################'
sudo apt-get install build-essential checkinstall && apt-get build-dep imagemagick -y
sudo wget http://www.imagemagick.org/download/ImageMagick.tar.gz
sudo tar xzvf ImageMagick.tar.gz
cd ImageMagick-7.0.4-5
./configure
make clean
make
checkinstall
ldconfig /usr/local/lib

# GoogleChrome
echo '#####################################################'
echo 'install chrome and opera browsers'
echo '#####################################################'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo snap install opera

# GnomeTweak
echo '#####################################################'
echo 'install gnome tweak'
echo '#####################################################'
sudo apt-add-repository universe
sudo apt install gnome-tweak-tool

# Python3, Pip3, Virtualenv
echo '#####################################################'
echo 'install python3,pip3 and virtualenv'
echo '#####################################################'
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3 .8
sudo apt install python3-pip
pip3 install virtualenv

# Virtual Studio install
echo '#####################################################'
echo 'install virtual studio'
echo '#####################################################'
sudo snap install --classic code

# Ulauncher install
echo '#####################################################'
echo 'install virtual Ulauncher'
echo '#####################################################'
sudo add-apt-repository ppa:agornostal/ulauncher
wget https://github.com/Ulauncher/Ulauncher/releases/download/5.8.1/ulauncher_5.8.1_all.deb
sudo apt install ./ulauncher_5.8.1_all.deb

# Sacker install
echo '#####################################################'
echo 'install virtual sacker'
echo '#####################################################'
sudo apt install snapd
sudo snap install stacker

# Timeshift install
echo '#####################################################'
echo 'install timeshift'
echo '#####################################################'
sudo add-apt-repository -y ppa:teejee2008/ppa
sudo apt update
sudo apt install timeshift

