def valid_address? address
  address.match(/\Ahttps?:\/\/\S+\z/)
end

puts "Enter the address please: "
address = gets.chomp
puts valid_address?(address) ? "Valid address" : "Invalid address."