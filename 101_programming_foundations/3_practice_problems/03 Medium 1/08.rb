# Ask TA about this

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# hashes passed by reference, indexed assignment is mutating.

p munsters

names = ["Herman", "Lily", "Grandpa", "Eddie", "Marilyn"]

def mess_with_names(demo_array)
  demo_array.each do |member|
    member = " Addams"
  end
end

mess_with_names(names)

p names # nothing changes because assignment is non-mutating.