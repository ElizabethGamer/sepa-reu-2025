if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/minmax_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/minmax_test[1]_tests.cmake")
else()
  add_test(minmax_test_NOT_BUILT minmax_test_NOT_BUILT)
endif()
