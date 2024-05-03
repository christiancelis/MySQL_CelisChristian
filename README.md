# MySQL_CelisChristian

## Tema 1 Historia de MySQL

    - Clase a: Redes Corporativa WAN 0-127
    - Clase b: Redes Municipales MAN 128-191
    - Clase c: Redes Domesticas  LAN 192-223

## 2 OCTETOS DE RED Y DOS DE HOST

IP BETTY VIRTUAL MACHINE CAMPUS: 
    ssh p4student@172.16.101.128
contraseña: p4student o cedula

    cambiar contraseña en linux passwd
    Comandos linux -

 ```bash
clear
exit
pwd mirar la ruta absoluta
touch crear carpeta 
```


-> mirar integridad del servicio
```bash
    systemctl status mysql
``` 

flush privileges->
credenciales sql root y 1004921441
ip addr me da la ip



historial de comandos clase 2 de mayo
  cd p4student
   33  sudo apt-get install mysql-server
   34  mysql -h campus2023 -p
   35  mysql -h localhost -u campus2023 -p
   36  clear
   37  mysql -h localhost -u campus2023 -p
   38  clear
   39  systemctl
   40  systemctl mysql
   41  systemctl status  mysql
   42  clear
   43  sudo mysql
   44  sudo mysql -h localhost -u root -p
   45  clear
   46  sudo mysql -u root -p
   47  sudo mysql_secure_installation
   48  sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
   49  systemctl restart mysql
   50  systemctl stop mysql
   51  systemctl start mysql
   52  clear
   53  sudo mysql -u root -p
   54  sudo mysql_secure_installation
   55  sudo mysql -u root -p
   56  history






