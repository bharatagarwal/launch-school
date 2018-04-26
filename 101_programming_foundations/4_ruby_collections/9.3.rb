# throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages = ages.reject { |k,v| v > 100 } # acts non destructively 

ages.keep_if { |_,age| age < 100 } # acts destructively

# select! returns nil if no changes made.