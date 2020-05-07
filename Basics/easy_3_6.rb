# easy_3_6.rb

# write a method to create and exclusive or operator: xor?

def xor?(a, b)
  if a == true && b == false
    true
  elsif a == false && b == true
    true
  else
    false
  end
end

p xor?(true, false)
p xor?(false, true)
p xor?(false, false)
p xor?(true, true)
p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
puts ''

def xor?(a, b)
  (a && !b) || (!a && b)
end
p xor?(true, false)
p xor?(false, true)
p xor?(false, false)
p xor?(true, true)
p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
puts ''

def xor?(a, b)
  return true if (a && !b)
  return true if (!a && b)
  false
end
p xor?(true, false)
p xor?(false, true)
p xor?(false, false)
p xor?(true, true)
p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
