#!/usr/bin/env ruby

def staggered_case(string)
  staggered = string.chars.map.with_index do |char, index|
    if index.odd?
      char.downcase
    else
      char.upcase
    end
  end
  staggered.join
end

# Further exploration

def staggered_case(string, need_upper: true)
  staggered = string.chars.map do |char|
    result = need_upper ? char.upcase : char.downcase
    need_upper = !need_upper
    result
  end
  staggered.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
