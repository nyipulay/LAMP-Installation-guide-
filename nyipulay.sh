#!/bin/bash


lampinstall(){ 
	echo "-----Installing LAMP Server-----" 
	dnf update -y
        dnf install httpd -y
        systemctl restart -y
        dnf install mariadb mariadb-server
        systemctl restart mariadb
        mysql_secure_installation
        dnf install php php-mysql php-gd php-mcrypt php-mbstring php-pspell -y
	echo "-----LAMP Server Install Completed-----" 
	}	






echo -n "Username:" && read input1
echo -n "Password:" && read -s input2

if [ "$input1" = "admin" ]
then
	if [ "$input2" = "aungsoemin" ]
	then
	echo
	echo Welcome $input1 
	else
	echo 
	echo "Error! Password incorrect pls try again, thz"
	exit
	fi
else
echo "Error!"
exit
fi

if [ $(id -u) -eq 0 ]
then
        echo 
else
        echo "Error: This script has to be run under the root user."
        exit 
fi 

echo -e "\e[40;38;5;82m Welcome  \e[30;48;5;82m Nyipulay  \e[40;38;5;82m Script   \e[0m"
echo "+++---------Welcome---------++"
echo "+++---------Nyipulay--------++"
echo "+++---------Script----------++"     
echo "if u type help, can see help list"
helplist(){ 
    
echo "|##############################################|"
echo "|#################Helpl list###################|"   
echo "|##############################################|"
echo "| update      -   update your package          |"         
echo "| lampinstall -   Apache, MariaDB, PHP         |"
echo "| installcav  -   Clamav                       |"
echo "| installfw   -   firewall                     |"
echo "| about       -   version and developer details|"
echo "| exit        -   exit from shell              |"
echo "|##############################################|"     
    }
      
		




while true 
do

echo -n "nyipulay@ptoo>" 
read input



case $input in

        update) dnf update -y
                ;;
        lampinstall) lamp
                ;;
        installcav) dnf install clamav
                ;;
        installfw) dnf install firewalld
                ;;
        help) helplist
                ;;
        about) echo "This shell version is 1.0 and that script is writtern by nyipulay(09972144790)"
                ;;
        exit) exit
                ;;
        *) eval $input

esac
done

