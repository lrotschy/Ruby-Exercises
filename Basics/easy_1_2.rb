# easy_1_2.rb

# input = one integer, positive, negative, or 0
# output = return true if absolute value is odd
# assume the argument is a valid integer
# do not use #odd? or #even?

def is_odd?(int)
  int % 2 == 1
end

puts is_odd?(0)
puts is_odd?(3)
puts is_odd?(-5)
puts is_odd?(4)
puts is_odd?(-4)

def is_odd?(int)
  int.remainder(2) == 1 || int.remainder(2) == -1
end

puts ''
puts is_odd?(0)
puts is_odd?(3)
puts is_odd?(-5)
puts is_odd?(4)
puts is_odd?(-4)

def is_odd?(int)
  int.abs.remainder(2) == 1
end

puts ''
puts is_odd?(0)
puts is_odd?(3)
puts is_odd?(-5)
puts is_odd?(4)
puts is_odd?(-4)

def is_odd?(int)
  int.remainder(2) != 0
end

puts ''
puts is_odd?(0)
puts is_odd?(3)
puts is_odd?(-5)
puts is_odd?(4)
puts is_odd?(-4)
