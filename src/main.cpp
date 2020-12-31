#include <absl/container/flat_hash_map.h>

#include <iostream>
#include <nlohmann/json.hpp>
#include <xtensor/xarray.hpp>
#include <xtensor/xio.hpp>
#include <xtensor/xview.hpp>

#include "address_book.pb.h"
#include "subdir1/private_library.h"

using json = nlohmann::json;

int main() {
  std::cout << "xtensor\n";
  xt::xarray<double> arr1{
      {1.0, 2.0, 3.0}, {2.0, 5.0, 7.0}, {2.0, 5.0, 7.0}};  // NOLINT
  xt::xarray<double> arr2{5.0, 6.0, 7.0};                  // NOLINT
  xt::xarray<double> res = xt::view(arr1, 1) + arr2;
  std::cout << res << "\n";

  std::cout << "absl::flat_hash_map\n";
  absl::flat_hash_map<int, std::string> map1 = {
      {1, "abcde"},
      {2, "efghi"},
      {4, "vwxyz"},
  };
  for (const auto& entry : map1) {
    std::cout << entry.first << ": " << entry.second << "\n";
  }

  std::cout << "'Echo' function from library1\n";
  std::cout << Echo(5) << '\n';  // NOLINT

  json j = {
      {"pi", 3.141},  // NOLINT
      {"happy", true},
      {"name", "Niels"},
      {"nothing", nullptr},
      {"answer", {{"everything", 42}}},  // NOLINT
      {"list", {1, 0, 2}},
      {"object",
       {
           {"currency", "USD"}, {"value", 42.99},  // NOLINT
       }},
  };
  std::cout << "JSON:\n" << j.dump(2) << '\n';

  GOOGLE_PROTOBUF_VERIFY_VERSION;
  std::cout << "Protobuf\n";
  projectname::AddressBook address_book;

  return 0;
}
