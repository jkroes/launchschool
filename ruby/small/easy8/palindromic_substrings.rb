#!/usr/bin/env ruby

def substrings(string)
  result = []
  string.size.times do |index|
    1.upto(string.size - index) do |count|
      result << string.slice(index, count)
    end
  end
  result
end

def palindrome?(string)
  string.size > 1 && string == string.reverse
end

def palindromes(string)
  substrings(string).select { |sub| palindrome?(sub) }
end

p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
