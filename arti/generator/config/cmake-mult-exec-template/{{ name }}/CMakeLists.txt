cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD {{ cpp_std }})
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(
    {{ project_name }}
    VERSION {{ project_version }}
    DESCRIPTION "{{ project_description }}"
    LANGUAGES CXX
)

file(GLOB_RECURSE SOURCES "*.cpp")

foreach(FILE IN LISTS SOURCES)
    cmake_path(GET FILE PARENT_PATH PARENT)
    cmake_path(GET PARENT STEM PARENT_STEM)
    cmake_path(GET FILE STEM FILE_STEM)

    if (NOT ${PARENT_STEM} MATCHES "CompilerIdCXX")
        add_executable(
            ${PARENT_STEM}-${FILE_STEM} 
                ${FILE}
        )

        set_target_properties(
            ${PARENT_STEM}-${FILE_STEM} PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY ${PARENT}
                RUNTIME_OUTPUT_NAME ${FILE_STEM}
                SUFFIX ""
        )
    endif()
endforeach() 
