if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/topology_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/topology_test[1]_tests.cmake")
else()
  add_test(topology_test_NOT_BUILT topology_test_NOT_BUILT)
endif()
