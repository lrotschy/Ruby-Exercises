# 4_7.rb

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 34. The method doesn't mutate the caller, so answer still equals 42.
