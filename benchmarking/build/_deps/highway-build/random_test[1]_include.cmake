if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/random_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/random_test[1]_tests.cmake")
else()
  add_test(random_test_NOT_BUILT random_test_NOT_BUILT)
endif()
