# Programmatically determine if 42 lies between 10 and 100.

p (10..100).cover?(42)

# doesn't work without brackets

p ("a".."z").include?('A')

# include? is the depricated version

p (0..10).member?(5)

# member? can also be used