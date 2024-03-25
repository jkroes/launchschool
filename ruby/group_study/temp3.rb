#!/usr/bin/env ruby

x = ["flower", "flow", "fliwht"]

common = ''
# x.min_by(&:length).length.times do |i|
x.map(&:length).min.times do |i|
  char = x[0][i]
  break unless x.slice(1..-1).all? { |string| string[i] == char }
  common << char
end
p common
