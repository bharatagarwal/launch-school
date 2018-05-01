# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def new_id
  pattern = []
  num_per_section = [8,4,4,4,12]
  options = '1234567890abcdef'.chars

  num_per_section.each_with_index do |value, index| 
    pattern[index] = ''
    value.times {pattern[index] += options.sample}
  end

pattern.join('-')
end

p new_id
