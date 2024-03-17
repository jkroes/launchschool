#!/usr/bin/env ruby

def letter_case_count(string)
  {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^a-zA-Z')
  }
end

def letter_case_count(string)
  counts = {lowercase: 0, uppercase: 0, neither: 0}
  string.each_char do |char|
    case char
    when 'A'..'Z' then counts[:uppercase] += 1
    when 'a'..'z' then counts[:lowercase] += 1
    else counts[:neither] += 1
    end
  end
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
