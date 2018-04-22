if false
  greeting = “hello world”
end

greeting # => nil

# because even if the conditional won't be executed, the variable is considered declared with value nil in the local scope.