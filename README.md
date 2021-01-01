# C++ Project with Conda

[![Build, Lint, Test, Run](https://github.com/btjanaka/cpp-conda/workflows/Build,%20Lint,%20Test,%20Run/badge.svg)](https://github.com/btjanaka/cpp-conda/actions?query=workflow%3A"Build%2C+Lint%2C+Test%2C+Run")

**Status: In Development**

This is a template for using C++ with Conda, geared towards those working in
machine learning / AI / data science. Currently, it has an example of an app (in
`src/main.cpp`) and a library (in `include/libraryname/library.h`).

## Contents

<!-- vim-markdown-toc GFM -->

* [Features](#features)
* [Instructions](#instructions)
  * [Environment](#environment)
  * [Build](#build)
  * [Dev Tools](#dev-tools)
* [Motivation](#motivation)
  * [Why Conda?](#why-conda)
  * [Conclusions](#conclusions)
* [References](#references)

<!-- vim-markdown-toc -->

## Features

Currently, this template has only been set up and run on Linux systems, though
it _might_ work on other systems.

- Conda environment eliminates system dependencies
- GitHub Actions integration
- Build system with cmake, make, and gcc (all installed with `conda`; see
  [here](https://docs.conda.io/projects/conda-build/en/latest/resources/compiler-tools.html))
  for details on the compilers available through Anaconda
- Libraries
  - [Abseil](https://abseil.io)
  - [xtensor](https://xtensor.readthedocs.io/en/latest/)
  - [nlohmann/json](https://github.com/nlohmann/json#serialization--deserialization)
  - [protobuf](https://github.com/protocolbuffers/protobuf)
- Dev tools
  - Formatting (Google style) with
    [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
  - Linting with [clang-tidy](http://clang.llvm.org/extra/clang-tidy/)
    - This is not integrated directly into CMake because doing so will result in
      clang-tidy linting generated libraries like those from protobuf

## Instructions

### Environment

For development and building, this project runs within a Conda environment named
`cpp-conda`. If you do not have Conda installed, I recommend getting
[Miniconda](https://docs.conda.io/en/latest/miniconda.html). To create the
environment, run:

```bash
conda env create -f environment.yaml
conda activate cpp-conda
```

Alternatively, use [Mamba](https://github.com/mamba-org/mamba), a faster
alternative to Conda implemented in C++. Mamba primarily accelerates package
installation, so you will still need to use Conda to activate the environment.

```bash
conda install -c conda-forge mamba
mamba env create -f environment.yaml
conda activate cpp-conda
```

### Build

**Within the Conda environment,** build the project with:

```bash
mkdir build
cd build
cmake ..
make
```

Then run the `main` app with:

```bash
./bin/main
```

The binary should work both inside and outside the Conda env.

### Dev Tools

To set up the dev environment, first run a build as described above, then run:

```bash
make setup-clang-tools
```

To lint, run:

```bash
make lint
```

## Motivation

> "If all you have is a hammer, everything looks like a nail." - A Python user
> looking for better performance.

Modern machine learning typically depends on Python, but with that comes many
limitations. For example:

- As it is interpreted, Python is inherently slow.
- Due to its dynamic nature, there is a slew of errors that would easily be
  detected in a static language. For instance, one might run a long training
  loop, only to have the entire script crash due to an undefined variable.

C++ solves these problems, but it has a much higher learning curve than Python.
Thus, I wanted to answer the question: Is it feasible to do machine learning
research with C++? After all, many machine learning libraries are written in C++
with Python bindings, so there is a potentially large ecosystem waiting to be
tapped. Thus, I decided to build a project template that I could later leverage
in my research, whether for implementing algorithms, or for creating a library
(maybe with Python bindings).

Personally, I wanted to become more familiar with the open source C++ ecosystem,
particularly tools such as cmake and libraries such as abseil. In the past, I
have primarily used Python in my projects, and while it works well, there are
many inherent limitations, particularly with regard to performance and dynamic
typing.

### Why Conda?

In setting up this project, I found that a major problem with C++ is simply
getting set up. It is difficult to consistently set up the same libraries and
tools. There are several solutions. The first is to rely mainly on the system,
and do everything in a container such as with Docker or Singularity. However, I
find containers rather heavy, and they do not integrate well with development
environments (i.e. my vim setup :wink:). I came across a much simpler solution
while exploring
[xtensor](https://xtensor.readthedocs.io/en/latest/installation.html), which
suggested installing via Conda.

Conda is a prime choice for C++ dependency management because it is already
popular in ML and data science, and many powerful C++ libraries (abseil,
xtensor,...) and tools (cmake, make, clang,...) are available as Conda packages.
Furthermore, using primarily Conda dependencies may help if one wishes to deploy
their C++ project to Conda in the future. Finally, Conda makes it easy if one
needs to pull in Python libraries to perform functions not available in C++
(i.e. matplotlib, since C++ does not have a primary plotting library).

### Conclusions

To conclude, I am beginning to think the answer to my question is "yes, machine
learning research is possible with C++, but it takes a bit to get things set
up." I'll have to run a full project with this template to find out :D.

## References

- [cmake examples](https://github.com/ttroy50/cmake-examples)
- [cpp starter project](https://github.com/lefticus/cpp_starter_project)
- [awesome-cpp](https://github.com/fffaraz/awesome-cpp#artificial-intelligence)
