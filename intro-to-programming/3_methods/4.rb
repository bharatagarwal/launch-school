# won't print anything, because
# the return sends back nil.

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

