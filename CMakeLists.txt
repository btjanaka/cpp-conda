cmake_minimum_required(VERSION 3.15)
project(project)

# Put all binaries in `bin` - remove this to simply have binaries mirror source
# tree.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(src)

# TODO: move these to their proper subdirectories.
add_library(public_library src/libraryname/library.cpp)
target_include_directories(public_library PUBLIC include)

add_library(private_library src/subdir1/private_library.cpp)
target_include_directories(private_library PRIVATE src)
