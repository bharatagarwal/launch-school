name = "Robert"  # => "Robert"

chunk_of_code = Proc.new { puts "hi #{name}" }

chunk_of_code.call # => nil

# >> hi Robert