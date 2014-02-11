cmake_minimum_required(VERSION 2.8)

project(test)
find_package( OpenCV REQUIRED )

SET(SRC_LIST test.cpp)
add_executable(test ${SRC_LIST})
target_link_libraries(test ${OpenCV_LIBS} )
