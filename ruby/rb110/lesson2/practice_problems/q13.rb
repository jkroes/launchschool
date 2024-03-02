#!/usr/bin/env ruby

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

p (
  arr.sort_by do |subarr|
    subarr.filter {|num| num.odd?}
  end
)
