//
// Created by chris on 2/28/18.
//

#include "socket/Commander.h"
#include <iostream>


Commander::Commander() {

    m_tcpSocket = new TCPSocket();
    m_udpSocket = new UDPSocket();
    m_currentStrategy = new Strategy();
}

bool Commander::start() {

    int othersNumber = m_udpSocket->listenToNumber();
    std::cout << "others: " << othersNumber << std::endl;

    bool shouldPair = m_currentStrategy->check(othersNumber);
    std::cout << "paired: " << shouldPair << std::endl;

    bool sendSuccesfull = false;
    if(shouldPair) {
        m_tcpSocket->setIp( std::to_string( othersNumber ));
        m_tcpSocket->setMessage( std::to_string( othersNumber * othersNumber ));
        sendSuccesfull = m_tcpSocket->sendMessage();

    }

    std::cout << "sent: " << sendSuccesfull << std::endl;

    return  shouldPair && sendSuccesfull;
}

void Commander::setTcpSocket(TCPSocket *tcpSocket) {
    m_tcpSocket = tcpSocket;
}

void Commander::setUdpSocket(UDPSocket *udpSocket){
    m_udpSocket = udpSocket;
}
