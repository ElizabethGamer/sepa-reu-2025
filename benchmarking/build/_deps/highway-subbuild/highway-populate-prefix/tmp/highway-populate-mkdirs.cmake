# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-src"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/tmp"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/src/highway-populate-stamp"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/src"
  "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/src/highway-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/src/highway-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-subbuild/highway-populate-prefix/src/highway-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
