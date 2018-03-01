//
// Created by chris on 3/1/18.
//

#include <gtest/gtest.h>
#include <socket/Commander.h>


class CommanderTest : public ::testing::Test {

public:

    Commander commander;
};


TEST_F(CommanderTest, ) {

    ASSERT_FALSE( commander.start() );

    for(int i = 0; i < 5; ++i )
        ASSERT_TRUE( commander.start() );
}
