#!/usr/bin/env ruby

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'],
       third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, strings|
  strings.each do |string|
    string.each_char do |char|
      puts char if 'aeiou'.include? char
    end
  end
end
