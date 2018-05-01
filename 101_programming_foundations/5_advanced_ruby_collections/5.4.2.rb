my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# The variable my_arr is initialised with the return value of the Array#each method being called on a two-dimensional array with values [[1,2],[3,4]].

# Each inner array is passed to the block in turn, and assigned to the local variable arr. The Array#each method is again called on inner array, with each value bing assigned to the local variable num. 

# Inside the block for the each method call, the if control expression is calledon the return value of the comparison operator >.

# If the comparison condition is met, the puts method is called to give the string interpretation of the integer value of num.

# Since each is not concerned with the return value of the block, the assignment will be on the original block being called upon.