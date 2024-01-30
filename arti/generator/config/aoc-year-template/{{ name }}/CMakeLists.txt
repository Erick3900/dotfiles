cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD {{ cpp_std }})
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(
    {{ name }}
    LANGUAGES CXX
)

find_package(fmt CONFIG REQUIRED)
find_package(GTest CONFIG REQUIRED)
find_package(range-v3 CONFIG REQUIRED)
find_package(cryptopp CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)

file(GLOB SOURCES "Day*")

foreach(FILE IN LISTS SOURCES)
    cmake_path(GET FILE STEM DAY)

    file(READ "${FILE}/data/input" input)
    file(READ "${FILE}/data/example-p1" example_p1)
    file(READ "${FILE}/data/example-p2" example_p2)

    set(TEST_PATH "${CMAKE_CURRENT_BINARY_DIR}/${DAY}/src/test.cpp")
    set(SOLUTION_PATH "${CMAKE_CURRENT_BINARY_DIR}/${DAY}/src/solution.cpp")

    configure_file(
        "${FILE}/src/test.cpp"
        "${TEST_PATH}" ESCAPE_QUOTES
    )
    
    configure_file(
        "${FILE}/src/solution.cpp"
        "${SOLUTION_PATH}" ESCAPE_QUOTES
    )

    add_executable("${DAY}" "${SOLUTION_PATH}")
    add_executable("test-${DAY}" "${TEST_PATH}")
    
    target_link_libraries(
        "${DAY}" PRIVATE
            fmt::fmt
            range-v3::range-v3
            cryptopp::cryptopp
            nlohmann_json::nlohmann_json
    )

    target_link_libraries(
        "test-${DAY}" PRIVATE
            fmt::fmt
            GTest::gtest_main
            range-v3::range-v3
            cryptopp::cryptopp
            nlohmann_json::nlohmann_json
    )

    target_include_directories(
        "${DAY}" PRIVATE
            "${FILE}/src"
    )


    target_include_directories(
        "test-${DAY}" PRIVATE
            "${FILE}/src"
    )

    set_target_properties(
        "${DAY}" PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY "${FILE}/bin"
            RUNTIME_OUTPUT_NAME "solution"
            SUFFIX ""
    )
    
    set_target_properties(
        "test-${DAY}" PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY "${FILE}/bin"
            RUNTIME_OUTPUT_NAME "test"
            SUFFIX ""
    )
endforeach()

