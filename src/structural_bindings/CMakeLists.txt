cmake_minimum_required(VERSION 3.18)

project(structural_bindings)

add_library(${PROJECT_NAME}
  STATIC structural_bindings.cpp)

target_include_directories(${PROJECT_NAME}
  INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/)
