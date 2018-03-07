//
// Created by chris on 2/23/18.
//
#include <gtest/gtest.h>
#include "socket/TCPSocket.h"


TEST(TCP, unit_sendMessage) {

    TCPSocket testSocket;

    std::string normalString = "This is a test";
    std::string normalIP = "192.168.0.3";

   bool setMessageReturn = testSocket.setMessage(normalString);

    ASSERT_TRUE(setMessageReturn);

    bool setIPReturn = testSocket.setIp(normalIP);

    ASSERT_TRUE(setIPReturn);

    bool sendMessageReturn = testSocket.sendMessage();

    ASSERT_TRUE(sendMessageReturn);


}
