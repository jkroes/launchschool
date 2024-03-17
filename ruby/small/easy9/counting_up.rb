#!/usr/bin/env ruby

def sequence(int)
  [*1..int]
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
