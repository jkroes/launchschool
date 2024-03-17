#!/usr/bin/env ruby

# NOTE The use of the /i flag to ignore case in regex.

def staggered_case(string)
  need_upper = true
  staggered = string.chars.map do |char|
    result = need_upper ? char.upcase : char.downcase
    need_upper = !need_upper if char =~ /[a-z]/i
    result
  end
  staggered.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
