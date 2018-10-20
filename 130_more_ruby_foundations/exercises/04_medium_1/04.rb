birds = %w(raven finch hawk eagle osprey)  # => ["raven", "finch", "hawk", "eagle", "osprey"]

def types(birds)
  yield(birds)    # => nil
end               # => :types



types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."  # => nil
end                                       # => nil

# >> Raptors: hawk, eagle, osprey.