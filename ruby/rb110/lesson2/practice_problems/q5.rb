#!/usr/bin/env ruby

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters.values.select {|details| details["gender"] == "male"}.sum {|details| details["age"]}

# p(
#   munsters.values.sum do |details|
#     if details["gender"] == "male"
#       details["age"]
#     else
#       0
#     end
#   end
# )
