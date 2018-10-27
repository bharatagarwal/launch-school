a = [1, 3, 'cat']                      # => [1, 3, "cat"]
h = { dog: 'canine', fox: 'vulpine' }  # => {:dog=>"canine", :fox=>"vulpine"}

# creating enumerator

enum_a = a.to_enum  # => #<Enumerator: [1, 3, "cat"]:each>
enum_h = h.to_enum  # => #<Enumerator: {:dog=>"canine", :fox=>"vulpine"}:each>

enum_a.next  # => 1
enum_a.next  # => 3
enum_a.next  # => "cat"
enum_a.next # StopIteration exception
enum_h.next

# ~> StopIteration
# ~> iteration reached an end
# ~>
# ~> /Users/Bharat/launch-school/130_more_ruby_foundations/1_blocks/enumerator.rb:12:in `next'
# ~> /Users/Bharat/launch-school/130_more_ruby_foundations/1_blocks/enumerator.rb:12:in `<main>'