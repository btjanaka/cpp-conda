find_package(xtl REQUIRED)
find_package(xtensor REQUIRED)
find_package(absl REQUIRED)
find_package(nlohmann_json REQUIRED)

#
# Protobuf
#

find_package(Protobuf REQUIRED)

# Generate the header and source files. Can also use protobuf_generate_python to
# generate Python files.
protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS address_book.proto)

# Print path to generated files
message("PROTO_SRCS = ${PROTO_SRCS}")
message("PROTO_HDRS = ${PROTO_HDRS}")

#
# Main
#

add_executable(main main.cpp ${PROTO_SRCS} ${PROTO_HDRS})
target_link_libraries(
  main PRIVATE xtensor xtensor::optimize xtensor::use_xsimd absl::flat_hash_map
               private_library ${PROTOBUF_LIBRARIES})
target_include_directories(
  main PRIVATE . ${PROTOBUF_INCLUDE_DIRS}
               ${CMAKE_CURRENT_BINARY_DIR} # In order to capture the *.pb.h
)
