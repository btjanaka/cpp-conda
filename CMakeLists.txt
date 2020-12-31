cmake_minimum_required(VERSION 3.15)
project(project)

find_package(xtl REQUIRED)
find_package(xtensor REQUIRED)
find_package(absl REQUIRED)
find_package(nlohmann_json REQUIRED)

add_executable(main src/main.cpp)
target_link_libraries(main PRIVATE xtensor xtensor::optimize xtensor::use_xsimd
                                   absl::flat_hash_map)
