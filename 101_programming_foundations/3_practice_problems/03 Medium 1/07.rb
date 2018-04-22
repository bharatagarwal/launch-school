answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

# answer is not mutated.

p answer - 8 # ie. 42 - 8 = 34.