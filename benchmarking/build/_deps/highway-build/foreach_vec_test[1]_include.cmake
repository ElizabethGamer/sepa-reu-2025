if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/foreach_vec_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/foreach_vec_test[1]_tests.cmake")
else()
  add_test(foreach_vec_test_NOT_BUILT foreach_vec_test_NOT_BUILT)
endif()
