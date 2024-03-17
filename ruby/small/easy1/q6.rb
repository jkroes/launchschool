#!/usr/bin/env ruby

def triangle(n)
  lines = []
  n.times do |num|
    num+=1
    lines.push(?\s * (n-num) + ?* * num)
  end
  puts lines
end

triangle(5)
triangle(9)
