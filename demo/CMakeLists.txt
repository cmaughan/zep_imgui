cmake_minimum_required(VERSION 3.15)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(CMAKE_DEBUG_POSTFIX "-debug")
set(CMAKE_RELWITHDEBINFO_POSTFIX "-reldbg")

if (WIN32)
    set(VCPKG_TARGET_TRIPLET x64-windows-static-md)
endif()

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../vcpkg/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

project(Example)

find_package(imgui REQUIRED)
find_package(Vulkan REQUIRED)
find_package(Freetype REQUIRED)
find_package(sdl2 REQUIRED)

# Set this if we are sitting on SDL
add_definitions(-DZEP_USE_SDL)

# Set this to get the default file system
add_definitions(-DZEP_FEATURE_CPP_FILE_SYSTEM)

# Set this to use a lib instead of the single header build
#set (ZEP_LIB 1)

if (DEFINED ZEP_LIB)
add_subdirectory(zep/src)
else()
add_definitions(-DZEP_SINGLE_HEADER=1)
endif()

set(APP_ROOT ${CMAKE_CURRENT_LIST_DIR})
configure_file(${CMAKE_CURRENT_LIST_DIR}/cmake/config_app.h.cmake ${CMAKE_BINARY_DIR}/config_app.h)

set(SOURCES src/main.cpp
    src/editor.cpp
    include/editor.h)

if (WIN32)
set(SOURCES ${SOURCES}
    src/app.manifest)
endif()
add_executable(main ${SOURCES})

target_include_directories(main
    PRIVATE
    ${CMAKE_CURRENT_LIST_DIR} 
    ${CMAKE_BINARY_DIR}
    zep/include
    include
    )

target_link_libraries(main PRIVATE imgui::imgui SDL2::SDL2-static SDL2::SDL2main freetype)

if (DEFINED ZEP_LIB)
target_link_libraries(main PRIVATE Zep::Zep)
endif()
