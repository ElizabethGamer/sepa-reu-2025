if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/rotate_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/rotate_test[1]_tests.cmake")
else()
  add_test(rotate_test_NOT_BUILT rotate_test_NOT_BUILT)
endif()
