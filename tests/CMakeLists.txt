add_executable(${PROJECT_NAME}-test
  test_structural_bindings.cpp)

target_link_libraries(${PROJECT_NAME}-test
  gtest_main
  structural_bindings)
