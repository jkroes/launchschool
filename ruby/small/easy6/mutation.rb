#!/usr/bin/env ruby

# this code will print:

# Moe
# Larray
# CURLY
# SHEMP
# Harpo
# CHICO
# Grouch
# Zeppo

# Because array2 and array1 contain references to the same
# strings that are upcase-d in-place

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
