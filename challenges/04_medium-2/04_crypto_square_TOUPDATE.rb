def strip_sentence(input_sentence)
  input_sentence.downcase.delete('^a-z')
end

def find_rows(stripped_sentence)
  Math.sqrt(stripped_sentence.length).to_i
end

def perfect_square?(length)
  square_root = Math.sqrt(length)
  square_root.to_i.to_f == square_root
end

def decide_columns(stripped_sentence, rows)
  length = stripped_sentence.length
  if perfect_square?(length)
    rows
  else
    rows + 1
  end
end

def split_into_rectangle(stripped_sentence, rows, columns)
  length = stripped_sentence.length
  rectangular_array = []

  index = 0
  while index < length
    new_word = stripped_sentence[index..index + (columns - 1)]
    rectangular_array << new_word
    index += columns
  end

  rectangular_array
end

def transpose_array(rectangular_array, rows, columns)
  transposed_array = []

  (0..columns - 1).each do |column|
    new_word = ''
    (0..rows - 1).each do |row|
      new_word << rectangular_array[row][column].to_s
    end

    transposed_array << new_word
  end

  transposed_array
end

def format_array(transposed_array)
  transposed_array.join(' ')
end

def crypto_square(input_sentence)
  return '' if input_sentence.empty?

  stripped_sentence = strip_sentence(input_sentence)
  rows = find_rows(stripped_sentence)
  columns = decide_columns(stripped_sentence, rows)
  rectangular_array = split_into_rectangle(stripped_sentence, rows, columns)
  transposed_array = transpose_array(rectangular_array, rows, columns)
  format_array(transposed_array)
end