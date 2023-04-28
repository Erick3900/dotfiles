cmake_minimum_required(VERSION 3.20)

set(CMAKE_CXX_STANDARD {{ cpp_std }})
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project({{ name }})

file(GLOB_RECURSE PROBLEMS_SOURCES "**.cpp")

foreach(FILE IN LISTS PROBLEMS_SOURCES)
    cmake_path(GET FILE PARENT_PATH PARENT)
    cmake_path(GET PARENT STEM PARENT_STEM)
    cmake_path(GET FILE STEM FILE_STEM)

    if (NOT ${PARENT_STEM} MATCHES "CompilerIdCXX")
        if (NOT "${CMAKE_CURRENT_SOURCE_DIR}" MATCHES "${PARENT}")
            string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" PROJECT_PATH "${PARENT}")
            string(REPLACE "/" "-" PROBLEM_SOURCE "${PROJECT_PATH}")
            set(PROBLEM_TARGET "${PROBLEM_SOURCE}-${FILE_STEM}")
        else()
            set(PROBLEM_TARGET "${FILE_STEM}")
        endif()

        add_executable(
            ${PROBLEM_TARGET} 
                ${FILE}
        )

        set_target_properties(
            ${PROBLEM_TARGET} PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY ${PARENT}/bin
                RUNTIME_OUTPUT_NAME ${FILE_STEM}
                SUFFIX ""
        )
    endif()
endforeach()

file(GLOB_RECURSE CMAKE_CONFIGS "**.cmake")

foreach(FILE IN LISTS CMAKE_CONFIGS)
    cmake_path(GET FILE PARENT_PATH PARENT)
    include("${FILE}")
endforeach()
