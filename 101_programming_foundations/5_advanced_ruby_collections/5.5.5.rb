munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum = 0

males = munsters.select do |k,v|
  v["gender"] == "male"
end

males.each do |k,v|
  sum+=v['age']
end

p sum

# munsters.values.each do |details|
# munsters.each_value do |details|
# sum+= details['age'] if details[gender]==male
