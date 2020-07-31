cmake_minimum_required(VERSION 3.1)

project (BF)

add_compile_options("-O3")

add_executable(bf 
main.cpp
gene.cpp
bf.cpp)