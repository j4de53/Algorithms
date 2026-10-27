add_library(LibraryCPPClass STATIC
    array.cpp
    list.cpp
    stack.cpp
)

target_include_directories(LibraryCPPClass PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(Tests)