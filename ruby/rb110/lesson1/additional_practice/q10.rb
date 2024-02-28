#!/usr/bin/env ruby

# Kind of stoked that I nailed this problem first try without
# running any code.

def age_group(age)
  case age
  when 0..17 then 'kid'
  when 18..64 then 'adult'
  when 65.. then 'senior'
  end
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |hash|
  hash['age_group'] = age_group hash['age']
end

solution =
  { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
    "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
    "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
    "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
    "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

puts munsters == solution
