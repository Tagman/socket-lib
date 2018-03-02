//
// Created by chris on 3/1/18.
//

#include <gtest/gtest.h>
#include <socket/Commander.h>
#include <socket/MockStrategy.h>


class CommanderTest : public ::testing::Test {

public:

    Commander commander;
};


TEST_F(CommanderTest, workflow) {

    ASSERT_FALSE( commander.start() );

    for(int i = 0; i < 5; ++i )
        ASSERT_TRUE( commander.start() );
}

TEST_F(CommanderTest, newAndDelete){

    Commander* pCommander = new Commander();

    pCommander->start();

    delete pCommander;
    pCommander = 0;

    MockStrategy* mock = new MockStrategy();


    delete mock;
    mock = 0;
}
