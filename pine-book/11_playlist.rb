Dir.chdir '/Users/Bharat/launch-school/pl'

path_name = Dir.pwd

song_names = Dir['**/*.mp3']

# why doesn't name = path_name + "/" + name work with
# song_names.each do |name| ?

# completing path name
song_names.each_index do |i|
  song_names[i] = path_name + "/" + song_names[i]
end

filename = 'playlist.m3u'

# wrapper for random sort
def random_sort array
  random_sort_method array, []
end

# random sort from chap 10
def random_sort_method original_array, randomised_array
  while original_array.length > 0
    random_number = rand(original_array.length)
    randomised_array.push(original_array[random_number])
    original_array.delete_at(random_number)
  end
  randomised_array
end

#randomising array of songs
song_names = random_sort song_names

#writing file, adding a linebreak at the end
File.open filename, 'w' do |f|
  song_names.each do |song|
    f.write song+"\n"
  end
end