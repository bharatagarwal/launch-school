require 'yaml'

def yaml_save object, filename
  File.open filename, 'w' do |f|
    f.write(object.to_yaml)
  end
end

def yaml_load filename
  yaml_string = File.read filename
  YAML::load yaml_string
end

test_array = ['Slick Shoes',
              'Bully Binders',
              'Pinchers of Peril']

filename = 'Data\'s Gadgets.txt'

yaml_save test_array, filename

read_array = yaml_load filename

puts (read_array == test_array)