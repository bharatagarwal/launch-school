Dir.chdir '/Users/Bharat/launch-school/pl'

path_name = Dir.pwd
song_names = Dir['**/*.mp3']

song_names.each_index do |i|
  song_names[i] = path_name + "/" + song_names[i]
end

# card-sorting method
def card_shuffle array
  array.sort!
  length = array.length

  # dividing into half and rearranging - twice
  2.times do
    left_index = 0
    right_index = length/2
    shuffled_array = []

    while shuffled_array.length < length
      if shuffled_array.length % 2 == 0
        shuffled_array.push(array[right_index])
        right_index += 1
      else
        shuffled_array.push(array[left_index])
        left_index+= 1
      end
    end

    array = shuffled_array
  end

  # cutting array with random cut amount to add randomness
  new_array = []
  cut = rand(length)
  index = 0

  while index < length
    new_array.push (array[(index + cut) % length])
    index += 1
  end

  new_array
end

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

# first doing card sort
song_names = card_shuffle song_names

# then doing a random shuffle as before
song_names = random_sort song_names


filename = 'playlist.m3u'

#writing file, adding a linebreak at the end
File.open filename, 'w' do |f|
  song_names.each do |song|
    f.write song+"\n"
  end
end