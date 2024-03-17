#!/usr/bin/env ruby

def center_of(str)
  size = str.size
  start = size.even? ? (size / 2 - 1) : ( size / 2)
  length = size.even? ? 2 : 1
  str.slice(start, length)
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
