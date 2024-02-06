#!/usr/bin/env ruby

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |s| s.start_with? "s" }

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |s| s.start_with?("s") || s.start_with?("w") }
# NOTE Canonical answer is:
# arr.delete_if { |str| str.start_with?("s", "w") }
