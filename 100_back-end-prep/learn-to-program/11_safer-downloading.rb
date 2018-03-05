Dir.chdir '/Users/Bharat/launch-school/pcs'
pic_names = Dir['*.png']

puts 'What would you like to call this batch?'
batch_name = gets.chomp

puts
print "You have #{pic_names.length} files\n"



def file_name batch_name, num

  if num < 10
    return "#{batch_name}0#{num}.png"
  elsif num >=10
    return "#{batch_name}#{num}.png"
  end

end


pic_number = 1

pic_names.each do |name|

  new_name = file_name batch_name, pic_number
  puts new_name
  if File.exists?(new_name)
    puts 'Filename exists! Skipping over to next file'
    
    puts 'Do you want to cancel this process?'
    
    cancel = gets.chomp.downcase
    
    if cancel == 'y' || cancel == 'yes'
      puts 'Exiting for the safety of your files. Bye!'
      exit
    end

  else
    File.rename name, new_name
  end

  pic_number += 1
end