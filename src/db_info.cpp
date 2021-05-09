#include <string>

class db_info{
    public:
        std::string host, username, password;
        db_info(){
            host = "localhost";
            username = "root";
            password = "root";
        }
};

