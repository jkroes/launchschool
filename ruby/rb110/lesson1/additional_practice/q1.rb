#!/usr/bin/env ruby

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flinthash = {}
flintstones.each_with_index do |value, idx|
  flinthash[value] = idx
end
puts flinthash
