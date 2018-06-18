# An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.

  # IPv4 addresses are represented in dot-decimal notation, which consists of four decimal numbers, each ranging from 0 to 255 inclusive, separated by dots, e.g., 172.16.254.1. || element.to_i.to_s != element

  # Given a string, find out if it satisfies the IPv4 address naming rules.  

# problem
# IPv4 has four decimal numbers, each ranging from 0..255 inclusve
# addresses are supported by dots.
# check that input consists of four entities and seperated by dots
# indicate that it's not four entities or dots are incorrect
# check that the four entities are numbers and falling in range
# indicate the four entities are valid, and if not, which one and why?

# examples
# Examples  
# p isIPv4Address("172.16.254.1" ) == true  
# isIPv4Address(""172.316.254.1") == false 
# 316 is not in range [0, 255]  
# isIPv4Address(".254.255.0" ) == false 
# There is no first number.
# is_IPv4_address("a0.1.1.1")
# is_IPv4_address("0..1.0.0")

# data structures
# acceptable range to be a range, where include can be used.
# input to be the form of a string
# string to be split by '.', and ensure there are four entries in array
# check each entry and throw error at that entry if a. not a number, b. not in range
# return boolean for isIPv4Address

# algorithm
# get input
# split input by .
# check length of new array
# throw error if length is wrong
# check each element and throw error first if not a number, and then if not in range.
# create new method for returning boolean


ACCEPTABLE_RANGE = (0..255)

def isIPv4Address(string)
  individual_elements = string.split('.')

  if individual_elements.length != 4
    # puts "You've either entered too many dots or too many elements for an IPv4 address"
    return false
  end

  individual_elements.each_with_index do |element, index|
    if element == '' || element.to_i.to_s != element
      # puts "There is no number in position #{index + 1}."
      return false
    elsif !ACCEPTABLE_RANGE.include?(element.to_i)
      # puts "#{element} is not in range #{ACCEPTABLE_RANGE.first} to #{ACCEPTABLE_RANGE.last}."
      return false
    end
  end

  true
end

address1 = "172.316.254.1"

p isIPv4Address(address1)

# 316 is not in range [0, 255]  

address2 = ".254.255.0"
p isIPv4Address( address2)
# There is no first number.
# is_IPv4_address("a0.1.1.1")
# is_IPv4_address("0..1.0.0")