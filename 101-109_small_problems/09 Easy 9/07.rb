def swap_name string
  name, surname = string.split(' ')
  "#{surname}, #{name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
