# lookingglass

# Install Lookingglass Ubuntu 22.04

1. Login dengan privilege root
2. Sesuaikan Jam
##
    timedatectl set-timezone Asia/Jakarta

3. Install Web Server Apache2
##
    apt install apache2 apache2-utils -y

4. Install PHP Engine
##
    apt-get install php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml -y

5. Install MariaDB
##
    apt-get install mariadb-server -y

6. Install Database
##
    mysql_secure_installation

7. Download PHPMyAdmin
##
    wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-english.tar.gz 

8. Extrak File PHPMyAdmin
##
    tar xvf phpMyAdmin-5.1.1-english.tar.gz 

9. Pindahkan isi directory yang di extrak 
##
    mv phpMyAdmin-5.1.1-english /usr/share/phpmyadmin 
10. Buat file phpmyadmin.conf
##
    nano /etc/apache2/conf-enabled/phpmyadmin.conf

11. Masukan Script ke file phpmyadmin.conf
##
    Alias /phpmyadmin /usr/share/phpmyadmin 

12. Restart Apache2
##
    systemctl restart apache2

13. Download LookingGlass
##
    git clone https://github.com/telephone/LookingGlass.git 

14. Pindahkan Directori LookingGlass 
##
    mv LookingGlass /var/www/

15. Pisahkan File LookingGlass
##
    mv /var/www/LookingGlass/* /var/www/html/

16. Hapus File index.html pada directory /var/www/html/
##
    rm /var/www/html/index.html

17. masuk ke Folder LookingGlass
## 
    cd /var/www/html/LookingGlass/

18. Install LookingGlass
##
    bash configure.sh

19. Langkah Selanjutnya tinggal menyesuaikan (Domain, IP Public, Thema, dan Ukuran File yang akan di test)
20. Download File ajax.php
##
    wget https://raw.githubusercontent.com/Iyankz/lookingglass/refs/heads/main/ajax.php

21. Copy File ajax.php yang sudah di download
##
    cp ajax.php /var/www/html/ajax.php

22. Restart Apache2
##
    systemctl restart apache2

22. Akses IP/Domain server lookingglass
23. Jika ingin memodifikasi tampilan lookingglass bisa edit file :
##
    nano /var/www/html/index.php 
