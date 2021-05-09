#include <iostream>
#include "mysql-cppconn-8/jdbc/mysql_connection.h"
#include "mysql-cppconn-8/jdbc/cppconn/driver.h"
#include "db_info.cpp"
//#include <mysql/mysql.h>

using namespace std;

int main(){
    cout << "Hello World";
    db_info db_info;

    sql::Driver *driver;
    sql::Connection *con;

    driver = get_driver_instance();
    con = driver->connect(db_info.host, db_info.username, db_info.password);
    con->setSchema("RPG");

    delete con;

    return 0;
}