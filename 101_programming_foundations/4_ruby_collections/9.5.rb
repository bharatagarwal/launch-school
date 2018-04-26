flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


loc = 0

flintstones.each_with_index do |name, index|
  if name[0..1] == 'Be'
    loc = index
    break
  end
end

p loc

# or index(obj) => nil or int
# flinstones.index {|name| name[0, 2] == 'Be'}