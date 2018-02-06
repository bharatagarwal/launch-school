# dict_array = []
# dict_hash = {}

# dict_array[0] = 'candle'
# dict_array[1] = 'glasses'
# dict_array[2] = 'truck'

# dict_hash['shia-a'] = 'candle'
# dict_hash['shaya'] =  'glasses'
# dict_hash['shasha'] = 'truck'

# # print dict_array
# # puts
# # print dict_hash

# weird_hash = Hash.new

# weird_hash[12] = 'monkeys'
# weird_hash[[]] = 'emptiness'
# weird_hash[Time.local(1990)] = 'no time like the present'

# weird_hash.each do |key, value|
#   print key.to_s + ": " + value.to_s
#   puts
# end

counter = 0
string = 'damsbusters'



def roman_valid? string

  num = string.length-1 

  while num > 4

    if string[num] == string[num-1]
      counter+=1
      num -= 1
    end
  end

  return counter
end


