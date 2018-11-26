# recursion is the official name for when a function calls itself.

def countdown(number)
  return if number == 0 # base case
  
  puts number
  countdown(number - 1)
end

countdown(10)

# >> 10
# >> 9
# >> 8
# >> 7
# >> 6
# >> 5
# >> 4
# >> 3
# >> 2
# >> 1

# in almost any case you can use a loop, you can use recursion.

def factorial(number)
  return 1 if number == 1
  number * factorial(number - 1)
end

factorial(3) # => 6

# the computer calls factorial(3), and before the method is complete, it calls factorial(2), and before factorial(2) is complete, it calls factorial(1).

# when the computer runs factorial(1), it is still in the middle of factorial(2), which is still in the middle of factorial(1)

# the computer uses a stack to keep track of its functions.
# this is called the "call stack"

# the computer needs to remember which function is being called from, and for that it pushes factorial(3), and then factorial(2) onto the call stack.

# stack overflow is when the computer keeps pushing a method onto a stack, until there's no more room in the computer's memory.

# traversing through a file system

def find_directories(directory)
  Dir.foreach(directory) do |filename|
    if File.directory?("#{directory}/#{filename}") &&
      ['.', '..', '.git'].include?(filename) == false
      puts "#{directory}/#{filename}"

      find_directories("#{directory}/#{filename}")
    end
  end
end

find_directories('..')

# >> ../101_programming_foundations
# >> ../101_programming_foundations/6_slightly_larger_programs
# >> ../101_programming_foundations/3_practice_problems
# >> ../101_programming_foundations/3_practice_problems/02 Easy 2
# >> ../101_programming_foundations/3_practice_problems/03 Medium 1
# >> ../101_programming_foundations/3_practice_problems/01 Easy 1
# >> ../101_programming_foundations/3_practice_problems/05 Hard
# >> ../101_programming_foundations/3_practice_problems/04 Medium 2
# >> ../101_programming_foundations/4_ruby_collections
# >> ../101_programming_foundations/5_advanced_ruby_collections
# >> ../101_programming_foundations/practice
# >> ../101_programming_foundations/2_small_programs
# >> ../challenges
# >> ../challenges/03_medium-1
# >> ../challenges/01_easy-1
# >> ../challenges/02_easy-2
# >> ../challenges/05_advanced-1
# >> ../challenges/04_medium-2
# >> ../120_object_oriented_programming
# >> ../120_object_oriented_programming/2_oop
# >> ../120_object_oriented_programming/2_oop/03_inheritance
# >> ../120_object_oriented_programming/2_oop/02_classes-and-objects
# >> ../120_object_oriented_programming/2_oop/15_rps_bonus
# >> ../120_object_oriented_programming/2_oop/06_oop_rps
# >> ../120_object_oriented_programming/2_oop/17_quiz
# >> ../120_object_oriented_programming/2_oop/04_collaborator-objects
# >> ../120_object_oriented_programming/6_problems
# >> ../120_object_oriented_programming/6_problems/7_medium_1
# >> ../120_object_oriented_programming/6_problems/9_advanced_1
# >> ../120_object_oriented_programming/6_problems/8_debugging
# >> ../120_object_oriented_programming/6_problems/6_easy_2
# >> ../120_object_oriented_programming/6_problems/5_easy-1
# >> ../120_object_oriented_programming/4_practice_problems
# >> ../120_object_oriented_programming/4_practice_problems/easy-3
# >> ../120_object_oriented_programming/4_practice_problems/easy-2
# >> ../120_object_oriented_programming/4_practice_problems/hard-1
# >> ../120_object_oriented_programming/4_practice_problems/medium-1
# >> ../120_object_oriented_programming/4_practice_problems/easy-1
# >> ../120_object_oriented_programming/1_oop-readings
# >> ../120_object_oriented_programming/1_oop-readings/lsbook
# >> ../120_object_oriented_programming/139 assessment
# >> ../120_object_oriented_programming/139 assessment/atbash_cipher
# >> ../120_object_oriented_programming/7_notes
# >> ../120_object_oriented_programming/5_slightly_larger_oo_programs
# >> ../101-109_small_problems
# >> ../101-109_small_problems/02 Easy 2
# >> ../101-109_small_problems/01 Easy 1
# >> ../101-109_small_problems/09 Easy 9
# >> ../101-109_small_problems/11 Medium 2
# >> ../101-109_small_problems/13 Debugging
# >> ../101-109_small_problems/04 Easy 4
# >> ../101-109_small_problems/07 Easy 7
# >> ../101-109_small_problems/03 Easy 3
# >> ../101-109_small_problems/10 Medium 1
# >> ../101-109_small_problems/08 Easy 8
# >> ../101-109_small_problems/12 Advanced 1
# >> ../101-109_small_problems/05 Easy 5
# >> ../101-109_small_problems/06 Easy 6
# >> ../notes
# >> ../sandbox
# >> ../170_web_development
# >> ../170_web_development/notes
# >> ../100_back-end_prep
# >> ../100_back-end_prep/learn-to-program
# >> ../100_back-end_prep/intro-to-programming
# >> ../100_back-end_prep/intro-to-programming/1_basics
# >> ../100_back-end_prep/intro-to-programming/10_exercises
# >> ../100_back-end_prep/intro-to-programming/2_variables
# >> ../100_back-end_prep/intro-to-programming/8_files
# >> ../100_back-end_prep/intro-to-programming/6_arrays
# >> ../100_back-end_prep/intro-to-programming/3_methods
# >> ../100_back-end_prep/intro-to-programming/4_flow-control
# >> ../100_back-end_prep/intro-to-programming/9_more
# >> ../100_back-end_prep/intro-to-programming/7_hashes
# >> ../100_back-end_prep/intro-to-programming/5_loops+iterators
# >> ../130_more_ruby_foundations
# >> ../130_more_ruby_foundations/1_blocks
# >> ../130_more_ruby_foundations/assessment
# >> ../130_more_ruby_foundations/exercises
# >> ../130_more_ruby_foundations/exercises/04_medium_1
# >> ../130_more_ruby_foundations/exercises/02_easy_2
# >> ../130_more_ruby_foundations/exercises/01_easy_1
# >> ../130_more_ruby_foundations/exercises/03_easy_testing
# >> ../130_more_ruby_foundations/exercises/05_medium_2
# >> ../130_more_ruby_foundations/2_testing