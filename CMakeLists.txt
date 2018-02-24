## Setup ##
cmake_minimum_required(VERSION 3.2)
project(socket-lib)
set(CMAKE_CXX_STANDARD 14)


## access to external libs

set( external_dir ${PROJECT_SOURCE_DIR}/../external )

## set directory variables
set(SOCKET_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include/)
set(SOCKET_SOURCE_DIR ${PROJECT_SOURCE_DIR}/src )



## Combining translation units
set(socket_impl ${SOCKET_SOURCE_DIR}/TCPSocket.cpp)
set(socket_header ${SOCKET_INCLUDE_DIR}/socket/TCPSocket.h)

add_library(socket
        ${socket_impl}
        )


target_include_directories(socket PUBLIC
        ${SOCKET_INCLUDE_DIR}
        )

message(STATUS "SOCKET_INC: ${SOCKET_INCLUDE_DIR}" )


## Testing

if ( CMAKE_BUILD_TYPE STREQUAL "UnitTest" )
        ## Setup dirs and source
        add_subdirectory(       ${external_dir}/gtest/ 
                                ${external_dir}/gtest/internal-build/ 
                        )

            find_package(Threads REQUIRED)

        link_directories( ${GTEST_LIBS_DIR} )
        set ( project_test_dir ${PROJECT_SOURCE_DIR}/test/)

        set(unit_src 
                ${project_test_dir}/unit_TCP_sendMessage.cpp
                )

        ## Target Creation
        add_executable(unit_TCP
                ${unit_src}
                )


        add_dependencies(unit_TCP googleInstall socket)

        ## Add include dirs
        target_include_directories( unit_TCP PUBLIC
                ${GTEST_INCLUDE_DIR}
                ${SOCKET_INCLUDE_DIR}
                )

        ## link libs to test-runner
        target_link_libraries(unit_TCP
                gtest
                gtest_main
                socket
                ${CMAKE_THREAD_LIBS_INIT}

                )

endif ()