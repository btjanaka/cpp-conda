cmake_minimum_required(VERSION 3.15)
project(project)

find_package(xtl REQUIRED)
find_package(xtensor REQUIRED)
find_package(absl REQUIRED)
find_package(nlohmann_json REQUIRED)

add_library(private_library src/subdir1/private_library.cpp)
target_include_directories(private_library PRIVATE src)

add_executable(main src/main.cpp)
target_link_libraries(main PRIVATE xtensor xtensor::optimize xtensor::use_xsimd
                                   absl::flat_hash_map private_library)
target_include_directories(main PRIVATE src)

add_library(public_library src/libraryname/library.cpp)
target_include_directories(public_library PUBLIC include)
