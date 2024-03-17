#!/usr/bin/env ruby


def letter_percentages(string)
  counts = {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^a-zA-Z')
  }

  total_count = counts.values.sum
  counts.transform_values { |count| count.to_f / total_count * 100 }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Further exploration: Format the percentages

def letter_percentages(string)
  counts = {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^a-zA-Z')
  }

  total_count = counts.values.sum
  counts.transform_values do |count|
    pct = count.to_f / total_count * 100
    pct.round(1) # format("%.1f", pct).to_f
  end
end

p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}
