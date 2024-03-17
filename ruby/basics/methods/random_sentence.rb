#!/usr/bin/env ruby

# NOTE I could have used the Array#sample method instead of rand and indexing

def name(names)
  names[rand(names.size)]
end

def activity(activities)
  activities[rand(activities.size)]
end

def sentence(name, activity)
  puts "#{name} is #{activity}"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
