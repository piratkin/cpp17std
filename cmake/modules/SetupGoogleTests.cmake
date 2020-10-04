set(GTEST_SUB_DIR build)

if(GTEST_CACHE_DIR)
  set(GTEST_SUB_DIR cache)
endif()

set(GTEST_SRCS_DIR ${CMAKE_SOURCE_DIR}/${GTEST_SUB_DIR}/gtest-src)
set(GTEST_BUILD_DIR ${CMAKE_SOURCE_DIR}/${GTEST_SUB_DIR}/gtest-build)
set(GTEST_TEMPLATE ${CMAKE_SOURCE_DIR}/cmake/template/gtest.cmake.in)

# Download and unpack googletest at configure time
configure_file(${GTEST_TEMPLATE} ${GTEST_BUILD_DIR}/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result WORKING_DIRECTORY ${GTEST_BUILD_DIR})

if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result WORKING_DIRECTORY ${GTEST_BUILD_DIR})

IF(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
ENDIF()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${GTEST_SRCS_DIR}
                 ${GTEST_BUILD_DIR}
                 EXCLUDE_FROM_ALL)

# The gtest/gtest_main targets carry header search path
# dependencies automatically when using CMake 2.8.11 or
# later. Otherwise we have to add them here ourselves.
if(CMAKE_VERSION VERSION_LESS 2.8.11)
  include_directories("${gtest_SOURCE_DIR}/include")
endif()
