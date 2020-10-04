set(PRODUCE_FILE ${CMAKE_SOURCE_DIR}/cache/produce.txt)
set(BUILD_FILE ${CMAKE_SOURCE_DIR}/cache/build.txt)
set(PROJECT_HEADER_TEMPLATE ${CMAKE_SOURCE_DIR}/cmake/template/project.h.in)
set(BUILD_SRCS ${CMAKE_SOURCE_DIR}/cmake/sources/current_build.c)
set(BUILD_OUTPUT ${CMAKE_SOURCE_DIR}/build/current_build)

# Update produce information
IF(EXISTS ${PRODUCE_FILE})
  file(READ ${PRODUCE_FILE} PROJECT_PRODUCE_COUNT)
  math(EXPR PROJECT_PRODUCE_COUNT "${PROJECT_PRODUCE_COUNT} + 1")
  message(STATUS "Current production: ${PROJECT_PRODUCE_COUNT}" )
ELSE()
  set(PROJECT_PRODUCE_COUNT "1")
  message(NOTICE "First production!")
ENDIF()

file(WRITE ${PRODUCE_FILE} "${PROJECT_PRODUCE_COUNT}")

# Update build information
IF(EXISTS ${BUILD_FILE})
  file(READ ${BUILD_FILE} PROJECT_BUILD_COUNT)
  math(EXPR PROJECT_BUILD_COUNT "${PROJECT_BUILD_COUNT} + 1")
  message(STATUS "Current build: ${PROJECT_BUILD_COUNT}" )
ELSE()
  set(PROJECT_BUILD_COUNT "1")
  message(NOTICE "First build!")
ENDIF()

configure_file(${PROJECT_HEADER_TEMPLATE}
  ${CMAKE_SOURCE_DIR}/include/project.h @ONLY)

add_custom_command(OUTPUT current_build
  COMMAND gcc -o ${BUILD_OUTPUT} ${BUILD_SRCS})

add_custom_target(run_current_build ALL
  COMMAND ${BUILD_OUTPUT} ${BUILD_FILE}
  DEPENDS current_build)
