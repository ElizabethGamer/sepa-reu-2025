if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/thread_pool_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/thread_pool_test[1]_tests.cmake")
else()
  add_test(thread_pool_test_NOT_BUILT thread_pool_test_NOT_BUILT)
endif()
