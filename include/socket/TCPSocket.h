//
// Created by chris on 2/23/18.
//

#ifndef BA_PROG_TCPSOCKET_H
#define BA_PROG_TCPSOCKET_H

#include <string>


class TCPSocket{

public:
    TCPSocket();

    bool setMessage(std::string msg);

    bool setIp(std::string ip);

    bool sendMessage();



private:

    std::string m_msg;
    std::string m_ip;
};
#endif //BA_PROG_TCPSOCKET_H
