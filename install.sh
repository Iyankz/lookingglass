#!/bash/bin
# Script: install.sh
# Purpose: Auto Install LookingGlass for Ubuntu 22.04
# Author: Iyankz (Github: https://github.com/Iyankz)

# --- Warna Output ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# --- Validasi Root ---
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: Script ini harus dijalankan dengan privilege root (sudo).${NC}"
   exit 1
fi

echo -e "${GREEN}== Starting Installation LookingGlass ==${NC}"

# 1. Sesuaikan Jam
echo -e "${YELLOW}[1/9] Mengatur Timezone ke Asia/Jakarta...${NC}"
timedatectl set-timezone Asia/Jakarta

# 2. Update System & Install Dependencies
echo -e "${YELLOW}[2/9] Update system dan install web server & PHP...${NC}"
apt update && apt upgrade -y
apt install apache2 apache2-utils mariadb-server php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml git wget -y

# 3. Secure MariaDB (Langkah ini tetap membutuhkan input manual jika ingin set password root)
echo -e "${YELLOW}[3/9] Menyiapkan MariaDB...${NC}"
systemctl start mariadb
systemctl enable mariadb
echo -e "${GREEN}Silakan ikuti instruksi mysql_secure_installation jika diperlukan.${NC}"

# 4. Install PHPMyAdmin
echo -e "${YELLOW}[4/9] Download dan Install PHPMyAdmin 5.2.1...${NC}"
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1-english.tar.gz -O /tmp/phpmyadmin.tar.gz
tar xvf /tmp/phpmyadmin.tar.gz -C /tmp/
mv /tmp/phpMyAdmin-5.2.1-english /usr/share/phpmyadmin
rm /tmp/phpmyadmin.tar.gz

# 5. Konfigurasi Apache untuk PHPMyAdmin
echo -e "${YELLOW}[5/9] Konfigurasi Apache Alias untuk /phpmyadmin...${NC}"
echo "Alias /phpmyadmin /usr/share/phpmyadmin" > /etc/apache2/conf-enabled/phpmyadmin.conf
systemctl restart apache2

# 6. Clone LookingGlass
echo -e "${YELLOW}[6/9] Mendownload file LookingGlass dari repository...${NC}"
cd /tmp
git clone https://github.com/telephone/LookingGlass.git
rm -f /var/www/html/index.html
cp -rv /tmp/LookingGlass/* /var/www/html/

# 7. Konfigurasi LookingGlass (INTERAKTIF)
echo -e "${YELLOW}[7/9] Menjalankan Konfigurasi LookingGlass...${NC}"
echo -e "${GREEN}Mohon masukkan detail (Domain, IP, dll) pada prompt di bawah:${NC}"
cd /var/www/html/LookingGlass/
bash configure.sh

# 8. Update ajax.php dari Repo Iyankz
echo -e "${YELLOW}[8/9] Mengunduh patch ajax.php dari Repo Iyankz...${NC}"
cd /var/www/html/
wget https://raw.githubusercontent.com/Iyankz/lookingglass/refs/heads/main/ajax.php -O ajax.php

# 9. Finalisasi Permissions & Restart
echo -e "${YELLOW}[9/9] Mengatur permission dan restart service...${NC}"
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
systemctl restart apache2

echo -e "-------------------------------------------------------"
echo -e "${GREEN}INSTALASI SELESAI!${NC}"
echo -e "Akses LookingGlass di: ${YELLOW}http://$(hostname -I | awk '{print $1}')${NC}"
echo -e "Akses PHPMyAdmin di  : ${YELLOW}http://$(hostname -I | awk '{print $1}')/phpmyadmin${NC}"
echo -e "-------------------------------------------------------"
