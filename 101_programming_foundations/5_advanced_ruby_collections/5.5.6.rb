munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (Name) is a (age)-year-old (male or female).

munsters.each do |k,v|
  puts "#{k} is a #{v['age']}-year-old #{v['gender']}"
end

# also each_pair