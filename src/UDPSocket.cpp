//
// Created by chris on 2/28/18.
//

#include <iostream>
#include "socket/UDPSocket.h"

UDPSocket::UDPSocket() {
    heighestNumber = 0;
}

int UDPSocket::listenToNumber() {
    //szenario: Ever increasing blockheights incoming
    std::cout << "recieved number: " << heighestNumber << std::endl;


    return heighestNumber++; // increment for next call
}


