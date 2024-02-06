#!/usr/bin/env ruby

def find_digit (num, div); num/div%10; end

n = 1845
find_digit n, 1000
find_digit n, 100
find_digit n, 10
find_digit n, 1
