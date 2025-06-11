cmake_minimum_required(VERSION 3.10)
project(beginnerparlay)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)

# Add include directory
include_directories(include)

# Collect all sources
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Create executable
add_executable(benchmark ${SOURCES})

# Include Parlay
find_package(Parlay REQUIRED)

# IPS4o
add_subdirectory("external/ips4o/")
target_link_libraries(benchmark PRIVATE ips4o)

# CPP11
target_include_directories(benchmark PRIVATE "external/cpp11sort/include")