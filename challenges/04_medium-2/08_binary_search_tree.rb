# Write a program that inserts numbers and searches in a binary tree.

# A binary search tree consists of a series of connected nodes. Each node contains a piece of data (e.g. the number 3), a variable named left, and a variable named right. The left and right variables point at nil, or other nodes. Since these other nodes in turn have other nodes beneath them, we say that the left and right variables are pointing at subtrees. All data in the left subtree is less than or equal to the current node's data, and all data in the right subtree is greater than the current node's data.

# problem
# ---

# create a binary tree, consisting of nodes
# node has: data, left, right. left or right could point to other nodes.
# left tree is less than or equal to current node
# right tree has greater than current node

# examples
# ---

#                4 
#       /               \
#      2                 6
#    /   \             /   \
#   1       3        5      7
#  / \     / \     /  \     / \
# nil nil nil nil nil  nil nil nil

# keep calling left until left has left and right as nil
# return value and mark as used.
# if left is not nil and unmarked, call left
# if left is marked or nil, call self
# 
# if left is marked call self
# if left and self are marked, call right


# four.left.left.data
# four.left.data
# four.left.right.data
# four.data
# four.right.left.data
# four.right.data
# four.right.right.data

#   4
#  /
# 0
#  \
#   1
#    \
#     2
#      \
#       3

# four.left.data
# four.left.right.data
# four.left.right.right.data
# four.left.right.right.right.data
# four.data

#               6
#        /             \
#       /               \
#      4                 8
#     /      \          /   \
#    1        5        7     9
#  /  \      / \      /       \
# nil  2   nil nil   nil       nil
#       \
#        3
#       / \
#     nil nil
# 
# data structures

# algorithm

class Bst
  @@instances = 0
  attr_reader :left, :right, :data
  attr_accessor :marked

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @marked = false
    @@instances += 1
  end

  def insert(new_data)
    if new_data <= @data && @left == nil
      @left = Bst.new(new_data)
    elsif new_data <= @data
      @left.insert(new_data)
    elsif new_data > @data && @right == nil
      @right = Bst.new(new_data)
    else
      @right.insert(new_data)
    end
  end

  def first_values(order)
    return four.left.left.data      if order == 1
    # keep going left until you hit right and left as nil
    return four.left.data           if order == 2
    # keep going left until you hit done, and return self
    return four.left.right.data     if order == 3
    # keep going left until you see done or self, move right
    return four.data                if order == 4
    # keep going left until you see done, return self.
    return four.right.left.data     if order == 5
    # keep going left, until you see done or self, go right, and same.
    return four.right.data          if order == 6
    # keep going left until you see done or self, 
    return four.right.right.data    if order == 7
    
  end
end

four = Bst.new(4)

four.insert 2
four.insert 6
four.insert 1
four.insert 3
four.insert 5
four.insert 7

all_data = []

# four.left.left.data
# four.left.data
# four.left.right.data
# four.data
# four.right.left.data
# four.right.data
# four.right.right.data

left, left
left
left, right
self
right, left
right
right, right
