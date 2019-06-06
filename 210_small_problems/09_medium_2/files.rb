require 'fileutils'

copy_and_paste = <<~NAMES
1	Lettercase Percentage Ratio	Not completed
2	Triangle Sides	Not completed
3	Tri-Angles	Not completed
4	Unlucky Days	Not completed
5	Next Featured Number Higher than a Given Value	Not completed
6	Sum Square - Square Sum	Not completed
7	Bubble Sort	Not completed
NAMES

def generate_filenames(heredoc, filetype)
  heredoc
    .split("\n")
    .map do |filename| 
      filename = filename.gsub(/\s+(completed|Not completed)$/, '');
      name_parts = filename.match(/(\d+)\s+(.*)/)
      number = name_parts[1]
      exercise_name = name_parts[2]
      if filetype == '.js'
        camel_case(number, exercise_name, '.js')
      elsif filetype == '.rb'
        snake_case(number, exercise_name, '.rb')
      end
    end.each do |filename| 
      FileUtils.touch(filename)
    end
end

def camel_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.split(' ').map.with_index do |name, index|
    if index == 0
      name.downcase
    else
      name.capitalize
    end
  end.join

  file_number + exercise_name + ext
end

def snake_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.gsub(/\ /, '_').downcase
  file_number + exercise_name + ext
end

generate_filenames(copy_and_paste, '.js')