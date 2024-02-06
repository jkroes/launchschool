#!/usr/bin/env ruby

strings = ["laboratory", "experiment", "Pans Labyrinth",
           "elaborate", "polar bear"]
strings.each do |s|
  puts s if s =~ /lab/
end
