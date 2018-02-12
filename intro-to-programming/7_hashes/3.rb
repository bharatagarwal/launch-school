family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family.each_key do |k|
  p k
end

family.each_value do |v|
  p v
end

family.each do |k,v|
  puts
  print k.to_s + ': ' + v.to_s
end