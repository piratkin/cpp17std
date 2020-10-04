add_subdirectory(structural_bindings)

add_executable (${PROJECT_NAME}
  main.cpp)

target_link_libraries (${PROJECT_NAME}
  structural_bindings)
