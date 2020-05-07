# 2_1.rb
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# I expect this code to print out 1 2 2 3 because uniq is not a mutating method. To print out 1 2 3 you would need to call uniq! on numbers or puts numbers.uniq.
