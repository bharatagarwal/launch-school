# using selection sort
# learnt to go through ruby documentation and find the relevant 
# method, in this case it's replace_at


original = ["i'm", "feeling", "blue", "let's", "do", "something", "new"]
sorted = []

lowest = original[0]

while original.length > 0

  # finding lowest
  original.each do |value|
    if value < lowest
      lowest = value
    end
  end

  # pushing lowest onto a new array
  sorted.push(lowest)
  original.delete_at(original.index(lowest).to_i)

  # resetting lowest
  lowest = original[0]
  
end

print sorted