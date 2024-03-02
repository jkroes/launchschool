#!/usr/bin/env ruby

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map {|arr2| arr2.sort {|x, y| y <=> x}}
