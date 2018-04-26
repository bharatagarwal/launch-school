munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

kid = 0..17
adult = 18..64
senior_limit = 65

munsters.each do |_, details|
    age = details["age"]
    details['age_group'] = if kid.cover?(age)
                            'kid'
                          elsif adult.cover?(age)
                            'adult'
                          elsif age > senior_limit
                            'senior'
                          end
end

p munsters

# case details["age"]
# when 0...18
#   details["age_group"] = 'kid'
# when 18...65
#   details["age_group"] = 'adult'
# else
#   details["age_group"] = 'senior'
# end