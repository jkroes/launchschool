#!/usr/bin/env ruby

def crunch(string)
  string2 = ''
  string.each_char do |char|
    string2 << char unless string2[-1] == char
  end
  string2
end

# Further exploration

# NOTE Capture groups and backreferences enable the following
# solution. A backreference can be used in the same string as the
# capture group and in the replacement string passed to gsub.

def crunch(string)
  string.gsub /(.)\1+/, '\1'
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
