cmake_minimum_required(VERSION 3.15)
project(project)

# Generate compile_commands.json to make it easier to work with clang based
# tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# TODO: Put this in a separate file. Source:
# https://github.com/lefticus/cpp_starter_project/blob/master/cmake/StaticAnalyzers.cmake
option(ENABLE_CLANG_TIDY "Enable static analysis with clang-tidy" ON)

if(ENABLE_CLANG_TIDY)
  find_program(CLANGTIDY clang-tidy)
  if(CLANGTIDY)
    set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY}
                             -extra-arg=-Wno-unknown-warning-option)
  else()
    message(SEND_ERROR "clang-tidy requested but executable not found")
  endif()
endif()

# Put all binaries in `bin` - remove this to simply have binaries mirror source
# tree.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(src)

# TODO: move these to their proper subdirectories.
add_library(public_library src/libraryname/library.cpp)
target_include_directories(public_library PUBLIC include)

add_library(private_library src/subdir1/private_library.cpp)
target_include_directories(private_library PRIVATE src)
