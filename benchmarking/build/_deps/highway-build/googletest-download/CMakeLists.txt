cmake_minimum_required(VERSION 2.8.12)

project(googletest-download NONE)

include(ExternalProject)
ExternalProject_Add(googletest
  GIT_REPOSITORY    https://github.com/google/googletest.git
  GIT_TAG           43efa0a4efd40c78b9210d15373112081899a97c
  SOURCE_DIR        "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-src"
  BINARY_DIR        "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-build"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ""
  TEST_COMMAND      ""
)
