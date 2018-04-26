{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3 # if returns nil when condition fails
    value
  end
end

# hsh.map returns an array.
# => [nil, 'bear']