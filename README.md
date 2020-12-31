# C++ Project with Conda

This is a template for using C++ with Conda, geared towards those working in
machine learning / AI / data science. Currently, it has an example of an app (in
`src/main.cpp`) and a library (in `include/libraryname/library.h`); build
instructions for these are included in `CMakeLists.txt`.

## Features

- Conda environment eliminates (?) system dependencies
- Build system with cmake, make, and gcc (all installed with `conda`; see
  [here](https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html))
  for details on the compilers available through Anaconda
- Libraries
  - [Abseil](https://abseil.io)
  - [xtensor](https://xtensor.readthedocs.io/en/latest/)
  - [nlohmann/json](https://github.com/nlohmann/json#serialization--deserialization)
- GitHub Actions integration

## References

- [cmake examples](https://github.com/ttroy50/cmake-examples)
- [awesome-cpp](https://github.com/fffaraz/awesome-cpp#artificial-intelligence)
