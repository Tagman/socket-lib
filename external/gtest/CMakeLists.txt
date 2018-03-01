cmake_minimum_required(VERSION 2.8.8)
project(gtest_builder C CXX)
include(ExternalProject)
include(FindUnixCommands)

set(GTEST_FORCE_SHARED_CRT ON)
set(GTEST_DISABLE_PTHREADS OFF)

if(MINGW)
    set(GTEST_DISABLE_PTHREADS ON)
endif()

#message( STATUS "Archive outpu" ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG})

ExternalProject_Add(googletest
    GIT_REPOSITORY  https://github.com/google/googletest.git
    SOURCE_DIR      "${PROJECT_SOURCE_DIR}/src"
    BINARY_DIR      "${CMAKE_BINARY_DIR}/googletest"
    INSTALL_DIR     "${PROJECT_SOURCE_DIR}/lib"
    STAMP_DIR       "${PROJECT_SOURCE_DIR}/googletest-stamp"
    BUILD_ALWAYS    false
    CMAKE_ARGS -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=DebugLibs
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=ReleaseLibs
    -DCMAKE_CXX_FLAGS=${MSVC_COMPILER_DEFS}
    -Dgtest_force_shared_crt=${GTEST_FORCE_SHARED_CRT}
    -Dgtest_disable_pthreads=${GTEST_DISABLE_PTHREADS}
    -DBUILD_GTEST=ON
    PREFIX "${PROJECT_SOURCE_DIR}"
    # Disable install step
    #INSTALL_COMMAND "find ${CMAKE_BINARY_DIR}/googletest -iname '*.a' -exec cp {} ${PROJECT_SOURCE_DIR}/lib \;"
    INSTALL_COMMAND ""
    )

MESSAGE(STATUS "gtest-src:  ${PROJECT_SOURCE_DIR}")

add_custom_target(googleInstall ${BASH} -c "${PROJECT_SOURCE_DIR}/install.sh -s ${CMAKE_BINARY_DIR}/googletest -d ${PROJECT_SOURCE_DIR}/lib"
                DEPENDS googletest
                WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
                )
    
  

# Specify include dir
ExternalProject_Get_Property(googletest source_dir)
set(GTEST_INCLUDE_DIR ${source_dir}/googletest/include PARENT_SCOPE)
set(GMOCK_INCLUDE_DIR ${source_dir}/googlemock/include PARENT_SCOPE)


# Specify MainTest's link libraries
#ExternalProject_Get_Property(googletest binary_dir)
set(GTEST_LIBS_DIR ${PROJECT_SOURCE_DIR}/lib PARENT_SCOPE)
set(GMOCK_LIBS_DIR ${PROJECT_SOURCE_DIR}/lib PARENT_SCOPE)

MESSAGE( STATUS "GTEST-BIN:         " ${binary_dir})
