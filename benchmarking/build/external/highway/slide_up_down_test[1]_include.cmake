if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/slide_up_down_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/external/highway/slide_up_down_test[1]_tests.cmake")
else()
  add_test(slide_up_down_test_NOT_BUILT slide_up_down_test_NOT_BUILT)
endif()
