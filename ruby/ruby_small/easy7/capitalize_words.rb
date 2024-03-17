#!/usr/bin/env ruby

def word_cap(string)
  cap_arr = string.split.map do |word|
    word.capitalize
  end
  cap_arr.join(?\s)
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
