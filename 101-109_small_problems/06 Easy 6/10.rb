# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(number)
  (1..number).each do |num|
    print " " * (number - num)
    puts "*" * num
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

puts

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********