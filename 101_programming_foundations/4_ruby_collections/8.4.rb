['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# returns object, in this case
{ 
  "a" => 'ant',
  "b'" => 'bear',
  "c'" => 'cat'
}