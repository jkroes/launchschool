#!/usr/bin/env ruby

a = [1, 4, 8, 11, 15, 19]

puts a.bsearch {|num| num > 8}
