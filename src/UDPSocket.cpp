//
// Created by chris on 2/28/18.
//

#include <iostream>
#include "UDPSocket.h"

int UDPSocket::listenToNumber() {
    //szenario: Ever increasing blockheights incoming
    std::cout << "recieved number: " << heighestNumber;


    return heighestNumber++; // increment for next call
}
