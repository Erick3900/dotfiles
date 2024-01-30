// AdventOfCode
// {{ name }}
// Date: {{ date }}
//
// Author: {{ author_name }}
// Github: {{ author_github }}
// {{ author_extra }}

#include <bits/stdc++.h>

#include <fmt/format.h>

#include "p1.hpp"
#include "p2.hpp"

int main(int argc, char *argv[]) {
    std::ios_base::sync_with_stdio(false), 
        std::cin.tie(nullptr), 
        std::cout.tie(nullptr);

    std::string input = R"(@input@)";

    auto ans_p1 = p1(std::stringstream{ input });
    auto ans_p2 = p2(std::stringstream{ input });

    fmt::print("{{ name }}\n  Part1: {}\n  Part2: {}\n", ans_p1, ans_p2);
}
