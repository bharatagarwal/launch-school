# An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.  # IPv4 addresses are represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255 inclusive, separated by dots, e.g., 172.16.254.1.  # Given a string, find out if it satisfies the IPv4 address naming rules.  # Examples  # inputString = "172.16.254.1" # isIPv4Address(inputString) == true  # inputString = "172.316.254.1" # isIPv4Address(inputString) == false    # 316 is not in range [0, 255]  # inputString = ".254.255.0" # isIPv4Address(inputString) == false    # There is no first number.

# extra test cases:
# is_IPv4_address("a0.1.1.1")
# is_IPv4_address("0..1.0.0")

# input -
# check for above 255 or below 0
# string, split with dot
# each convert to i, check value

# data structures
# input as string, convert to array, convert each in array to integers,
# check range,

range = 0..255

def isIPv4Address string
  string_array = string.split('.')
  num_array = string_array.map do |n|
                n = n.to_i
              end
  error_flag = false

  num_array.each do |n|
    if range.include?(num)
      error_flag = false
    else
      error_flag = true
      puts "#{n} is out of range!"
    end
  end

end

puts "Please enter address: "
address = gets.chomp

isIPv4Address(address)

isIPv4Address("172.16.254.1")
isIPv4Address("172.316.254.1")
isIPv4Address(".254.255.0")
