//
// Created by chris on 2/28/18.
//

#ifndef SOCKET_LIB_UDPSOCKET_H
#define SOCKET_LIB_UDPSOCKET_H


class UDPSocket {

public:
    UDPSocket(int heighestNumber);

    UDPSocket();

    int listenToNumber();

private:

    int heighestNumber;

};


#endif //SOCKET_LIB_UDPSOCKET_H
