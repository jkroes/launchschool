#!/usr/bin/env ruby

# NOTE The example solution is quite a bit simpler, though I
# changed a call to slice (#[]) with a call to start_with?
# flintstones.index { |name| name.start_with? == "Be" }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
result = []
flintstones.each_with_index do |name, index|
  result << index if name.start_with?('Be')
end
puts result.first
