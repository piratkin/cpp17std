cmake_minimum_required(VERSION 3.18)

set(CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules
  ${CMAKE_MODULE_PATH})

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
  set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()

project(cpp17std VERSION 0.7.0)

# Vendor information
set(PROJECT_VENDOR "Piratkin Sergey")
set(PROJECT_COPYRIGHT_YEAR "2020")
set(PROJECT_DOMAIN "rpi.ln")
# Set default C++ standard version to be used
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED true)
# Build-type-specific flags
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall -Wextra -O0")
set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_DEBUG} -pg" CACHE STRING
  "Flags used for profiling" FORCE)
# Additional options
set(GTEST_CACHE_DIR ON)

include(SetupInstallDirs)
include(UpdateProduce)
include(SetupGoogleTests)
include(SetupDoxygen)

include_directories(include)

add_subdirectory(docs)
add_subdirectory(src)
enable_testing()
add_subdirectory(tests EXCLUDE_FROM_ALL)



# set(${PROJECT_NAME}_SOURCES
#     src/lesson1.cpp
#     src/lesson2.cpp)

# set(RESOURCES
#     src/enml/enml.qrc)

# target_link_libraries(${LIBNAME} ${QT_LIBRARIES} ${THIRDPARTY_LIBS})
# set_target_properties(${LIBNAME} PROPERTIES COMPILE_DEFINITIONS "BUILDING_QUENTIER_DLL=1")
# add_definitions("-DQT_NO_CAST_FROM_ASCII -DQT_NO_CAST_TO_ASCII")

# set(TEST_HEADERS
#     src/tests/EncryptionManagerTests.h
#     src/synchronization/NotebookSyncCache.h)

# set(TEST_SOURCES
#     tests/EnexExportImportTests.cpp
#     synchronization/NotebookSyncCache.cpp)

# set(TEST_RESOURCES
#     src/tests/test_resources.qrc)

# qt_add_resources(${PROJECT_NAME}_TEST_RESOURCES_RCC ${TEST_RESOURCES})

# add_executable(test_${PROJECT_NAME} ${TEST_HEADERS} ${TEST_SOURCES} ${${PROJECT_NAME}_TEST_RESOURCES_RCC})
# add_test(test_${PROJECT_NAME} test_${PROJECT_NAME})

# target_link_libraries(test_${PROJECT_NAME} ${LIBNAME} ${QT_LIBRARIES} ${THIRDPARTY_LIBS})

# # modifying sources list with absolute paths for the static analyzer
# prepend_path(${PROJECT_NAME}_SOURCES "${${PROJECT_NAME}_SOURCES}" ${CMAKE_CURRENT_SOURCE_DIR})
# prepend_path(TEST_SOURCES "${TEST_SOURCES}" ${CMAKE_CURRENT_SOURCE_DIR})

# # collect the list of sources to be checked by the static analyzer
# set(LIBQUENTIER_CPPCHECKABLE_SOURCES ${${PROJECT_NAME}_SOURCES})
# list(APPEND LIBQUENTIER_CPPCHECKABLE_SOURCES ${TEST_SOURCES})

# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# enable_testing()

# add_custom_target(check COMMAND "${CMAKE_CTEST_COMMAND}" "--verbose")
