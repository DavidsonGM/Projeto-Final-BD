<h1 align="center">Projeto Final - Banco de Dados</h3>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Built Using](#built_using)
- [Authors](#authors)

## 🧐 About <a name = "about"></a>

This project was created for the Database class in order to apply all the knowledge acquired. 

In [doc](./doc) are all the theoretical content

In [src](./src) are the codes implementing an persitence layer and a CRUD for three related tables

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

MySQL Database

Python 3.8.5 with Pip Installed

### Installing

After clone the repository, install MySQL connector Python
```
pip install mysql-connector-python
```
Set up the database
```
mysql -p < db_scripts/Script_SQL.sql
```
Change database acess credentials in file [credentials.py.example](./src/credentials.py.example) and rename it to credentials.py


## 🎈 Usage <a name="usage"></a>

Run the program with the command below
```
 python3 ./src/main.py
```


## ⛏️ Built Using <a name = "built_using"></a>

- [MySQL](https://www.mysql.com/) - Database
- [Python](https://www.python.org/) - Program Environment

## ✍️ Authors <a name = "authors"></a>

- [David Gonçalves Mendes](https://github.com/DavidsonGM)
- [Gustavo Pereira Chaves](https://github.com/gustavo-oo)
