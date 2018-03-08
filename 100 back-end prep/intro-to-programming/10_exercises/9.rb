h = {a:1, b:2, c:3, d:4}

p h[:b]

h[:e] = 5

h.delete_if do |k,v| #delete_if actually mutates the hash.
  v < 3.5
end

# h2 = h.select {|k,v| v>=3.5} select returns an array, is non mutative

p h