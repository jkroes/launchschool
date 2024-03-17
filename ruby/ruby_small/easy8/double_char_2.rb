#!/usr/bin/env ruby

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if char =~ /[^aeiou]/ && char =~ /[a-zA-Z]/
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
