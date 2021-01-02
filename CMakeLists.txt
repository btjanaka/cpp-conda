cmake_minimum_required(VERSION 3.15)
project(project VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Generate compile_commands.json to make it easier to work with clang based
# tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Put all binaries in `bin` - remove this to simply have binaries mirror source
# tree.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(src)

# TODO: move these to their proper subdirectories.
add_library(public_library src/libraryname/library.cpp)
target_include_directories(public_library PUBLIC include)

add_library(private_library src/subdir1/private_library.cpp)
target_include_directories(private_library PRIVATE src)
