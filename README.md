# C++ Project with Conda

<!-- vim-markdown-toc GFM -->

* [Features](#features)
* [Motivation](#motivation)
  * [Why Conda?](#why-conda)
  * [Conclusions](#conclusions)
* [References](#references)

<!-- vim-markdown-toc -->

This is a template for using C++ with Conda, geared towards those working in
machine learning / AI / data science. Currently, it has an example of an app (in
`src/main.cpp`) and a library (in `include/libraryname/library.h`).

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
- [awesome-cpp](https://github.com/fffaraz/awesome-cpp#artificial-intelligence)
