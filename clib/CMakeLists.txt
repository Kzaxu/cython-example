cmake_minimum_required(VERSION 3.22)
project(foo C)

add_executable(foo foo.c)
target_include_directories(foo PUBLIC .)