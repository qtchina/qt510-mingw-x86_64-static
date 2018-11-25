# This file is part of MXE. See LICENSE.md for licensing information.

# https://cmake.org/cmake/help/latest

# Can't set `cmake_minimum_required` or `cmake_policy` in toolchain
# since toolchain is read before CMakeLists.txt
# See `target-cmake.in` for CMAKE_POLICY_DEFAULT_CMPNNNN

# Check if we are using mxe supplied version
#   - toolchain is included multiple times so set a guard in
#     environment to suppress duplicate messages
if(NOT ${CMAKE_COMMAND} STREQUAL /opt/mxe/usr/x86_64-pc-linux-gnu/bin/cmake AND NOT DEFINED ENV{_MXE_CMAKE_TOOLCHAIN_INCLUDED})
    message(WARNING "
** Warning: direct use of toolchain file is deprecated
** Please use prefixed wrapper script instead:
     x86_64-w64-mingw32.static-cmake [options] <path-to-source>
       - uses mxe supplied cmake version 3.10.0
       - loads toolchain
       - loads common run results
       - sets various policy defaults
    ")
    set(ENV{_MXE_CMAKE_TOOLCHAIN_INCLUDED} TRUE)
endif()

## General configuration
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64 CACHE STRING "System Processor")
set(MSYS 1)
set(CMAKE_EXPORT_NO_PACKAGE_REGISTRY ON)
# Workaround for https://www.cmake.org/Bug/view.php?id=14075
set(CMAKE_CROSS_COMPILING ON)


## Library config
set(BUILD_SHARED_LIBS OFF CACHE BOOL "BUILD_SHARED_LIBS" FORCE)
set(BUILD_STATIC_LIBS ON CACHE BOOL "BUILD_STATIC_LIBS" FORCE)
set(BUILD_SHARED OFF CACHE BOOL "BUILD_SHARED" FORCE)
set(BUILD_STATIC ON CACHE BOOL "BUILD_STATIC" FORCE)
set(LIBTYPE STATIC)


## Paths etc.
set(CMAKE_FIND_ROOT_PATH /opt/mxe/usr/x86_64-w64-mingw32.static)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_PREFIX_PATH /opt/mxe/usr/x86_64-w64-mingw32.static)
set(CMAKE_INSTALL_PREFIX /opt/mxe/usr/x86_64-w64-mingw32.static CACHE PATH "Installation Prefix")
# For custom mxe FindPackage scripts
set(CMAKE_MODULE_PATH "/opt/mxe/usr/share/cmake/modules" ${CMAKE_MODULE_PATH})


## Programs
set(CMAKE_C_COMPILER /opt/mxe/usr/bin/x86_64-w64-mingw32.static-gcc)
set(CMAKE_CXX_COMPILER /opt/mxe/usr/bin/x86_64-w64-mingw32.static-g++)
set(CMAKE_Fortran_COMPILER /opt/mxe/usr/bin/x86_64-w64-mingw32.static-gfortran)
set(CMAKE_RC_COMPILER /opt/mxe/usr/bin/x86_64-w64-mingw32.static-windres)
# CMAKE_RC_COMPILE_OBJECT is defined in:
#     <cmake root>/share/cmake-X.Y/Modules/Platform/Windows-windres.cmake
set(CPACK_NSIS_EXECUTABLE x86_64-w64-mingw32.static-makensis)

## Individual package configuration
file(GLOB mxe_cmake_files
    "/opt/mxe/usr/x86_64-w64-mingw32.static/share/cmake/mxe-conf.d/*.cmake"
)
foreach(mxe_cmake_file ${mxe_cmake_files})
    include(${mxe_cmake_file})
endforeach()
