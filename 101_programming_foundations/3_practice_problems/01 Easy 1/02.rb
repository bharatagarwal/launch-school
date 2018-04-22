Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?

not equal to

2. put ! before something, like !user_name

!user_name means to not be something.
usually when the variables evaluates to a boolean condition

3. put ! after something, like words.uniq!

usually indicates that the method mutates the caller.

4. put ? before something

doesnt do anything

5. put ? after something

the method should return boolean

or ternary operator like

answer = condition ? true value : false value

6. put !! before something, like !!user_name

type coercion