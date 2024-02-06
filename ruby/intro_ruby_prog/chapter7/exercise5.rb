#!/usr/bin/env ruby

hash = { a: 1, b: 2, c: 3 }
value = 5
puts hash.value?(value) ? "#{value} is in hash" : "#{value} is not in hash"
