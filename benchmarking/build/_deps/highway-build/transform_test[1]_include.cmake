if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/transform_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/transform_test[1]_tests.cmake")
else()
  add_test(transform_test_NOT_BUILT transform_test_NOT_BUILT)
endif()
