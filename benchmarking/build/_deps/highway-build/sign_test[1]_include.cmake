if(EXISTS "/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/sign_test[1]_tests.cmake")
  include("/home/elizabeth/sepa-reu-2025/benchmarking/build/_deps/highway-build/sign_test[1]_tests.cmake")
else()
  add_test(sign_test_NOT_BUILT sign_test_NOT_BUILT)
endif()
