//
// Created by chris on 2/23/18.
//


#include "socket/TCPSocket.h"
#include <string>
#include <iostream>

TCPSocket::TCPSocket() {
    m_msg = "";
}


bool TCPSocket::setMessage(std::string msg){

    if( !msg.empty() ) {
        m_msg = msg;
        return true;
    }

    return false;
}

bool TCPSocket::sendMessage() {

    std::cout << "Message: " << m_msg << "To: " << m_ip;
    return !m_msg.empty() && !m_ip.empty();
}

bool TCPSocket::setIp(std::string ip) {


    if( !ip.empty() ) {
        m_ip = ip;
        return true;
    }

    return false;
}


