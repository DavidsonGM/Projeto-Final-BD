# Projeto-Final-BD

Instalar libmysqlclient-dev, libmysqlcppconn-dev, libmysqlcppconn9

Setar o Banco: mysql -p < db_scripts/Registros_BD.sql

Alterar as infos no db_info.cpp

Compilar o programa: g++ main.cpp db_info.cpp -lmysqlcppconn
