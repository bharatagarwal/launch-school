['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4 # needs to be truthy
end

# => return value is always numerical with count, in this case 2