//
// Created by chris on 2/28/18.
//

#ifndef SOCKET_LIB_COMMANDER_H
#define SOCKET_LIB_COMMANDER_H


#include <socket/TCPSocket.h>
#include "UDPSocket.h"
#include "Strategy.h"

class Commander {

private:
    TCPSocket* m_tcpSocket;
    UDPSocket* m_udpSocket;
    Strategy* m_currentStrategy;

public:

    Commander();

    void start();

    bool setStrategy(Strategy* newStrategy);


/*
 * These setters are for dependency injection when testing
 */

    void setTcpSocket(TCPSocket *tcpSocket);

    void setUdpSocket(UDPSocket *udpSocket);

};


#endif //SOCKET_LIB_COMMANDER_H
