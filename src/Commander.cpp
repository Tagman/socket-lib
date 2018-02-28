//
// Created by chris on 2/28/18.
//

#include "Commander.h"
#include <iostream>


Commander::Commander() {

    m_tcpSocket = new TCPSocket();
    m_udpSocket = new UDPSocket();
    m_currentStrategy = new Strategy();
}

void Commander::start() {

    int othersNumber = m_udpSocket->listenToNumber();
    std::cout << "others: " << othersNumber << std::endl;

    bool shouldPair = m_currentStrategy->check(othersNumber);
    std::cout << "paired: " << shouldPair << std::endl;

    bool sendSuccesfull = false;
    if(shouldPair)
        sendSuccesfull = m_tcpSocket->sendMessage();


    std::cout << "sent: " << sendSuccesfull << std::endl;
}

void Commander::setTcpSocket(TCPSocket *tcpSocket) {
    m_tcpSocket = tcpSocket;
}

void Commander::setUdpSocket(UDPSocket *udpSocket){
    m_udpSocket = udpSocket;
}
