cmake_minimum_required(VERSION 3.24)
project(c-log VERSION "0.0.1" LANGUAGES C)
include(GNUInstallDirs)

if(NOT DEFINED C_LOG_BUILD_TESTS)
    set(C_LOG_BUILD_TESTS true)
endif()

add_library(c-log src/log.c)
target_include_directories(c-log PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
set_target_properties(c-log PROPERTIES PUBLIC_HEADER include/c-log/log.h)

if(C_LOG_BUILD_TESTS)
    add_executable(c-log-test test/test.c)
    target_link_libraries(c-log-test PUBLIC c-log)
    target_include_directories(c-log-test PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
endif()

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/c-log.pc.in
    ${CMAKE_CURRENT_BINARY_DIR}/c-log.pc
    @ONLY
)

install(TARGETS c-log
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/c-log
)

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/c-log.pc
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)
