#!/usr/bin/env ruby

require 'date'

def friday_13th(year)
  (1..12).map { |month| Date.new(year, month, 13).friday? }.tally[true]
end

# NOTE Check out the #next_month method in the example solution.
# Not sure whether this is more efficient than creating multiple
# date objects above.

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further exploration: first attempt

def five_fridays(year)
  five_fridays_count = 0

  date = Date.new(year, 1, 1)
  date = date.next_day until date.friday?
  friday_count = 0

  1.upto(12) do |month|
    while date.month == month
      friday_count += 1
      date = date.next_day(7)
    end
    if friday_count == 5
      five_fridays_count += 1
      # p month
    end
    friday_count = 0
  end

  five_fridays_count
end

# Further exploration: Recognizing that the minimum number of
# Fridays in a month is 4 and the maximum is 5.

def five_fridays(year)
  date = Date.new(year, 1, 1)
  date = date.next_day until date.friday?
  friday_count = 0
  while date.year == year
    friday_count += 1
    date = date.next_day(7)
  end
  friday_count % 48
end

p five_fridays(2020) == 4
p five_fridays(2021) == 5
p five_fridays(2027) == 5
p five_fridays(2100) == 5
