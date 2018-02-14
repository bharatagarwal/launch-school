
words=["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |word|
  if word =~ /lab/i # evaluates to nil when word not there.
    puts word
  end
end