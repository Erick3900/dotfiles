// AdventOfCode
// Test {{ name }}
// Date: {{ date }}
//
// Author: {{ author_name }}
// Github: {{ author_github }}
// {{ author_extra }}

#include <gtest/gtest.h>

#include "p1.hpp"
#include "p2.hpp"

const char *input_p1 = R"(@example_p1@)";
const char *input_p2 = R"(@example_p2@)";

TEST({{ name }}, p1) {
    const auto ans = p1(std::stringstream{ input_p1 });
    EXPECT_EQ(ans, 0);
}

TEST({{ name }}, p2) {
    const auto ans = p2(std::stringstream{ input_p2 });
    EXPECT_EQ(ans, 0);
}
