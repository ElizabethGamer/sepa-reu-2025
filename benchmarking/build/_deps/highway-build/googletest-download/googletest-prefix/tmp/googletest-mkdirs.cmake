# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-src"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-build"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/tmp"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/src/googletest-stamp"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/src"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/src/googletest-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/src/googletest-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/googletest-download/googletest-prefix/src/googletest-stamp${cfgdir}") # cfgdir has leading slash
endif()
