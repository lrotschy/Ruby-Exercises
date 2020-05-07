# easy_1_7.rb
=begin
input: a positive integer
do we need to validate?
output: return a string of alternative 1s and 0s, starting with 1. length = input.

START
Create a string of length of input / or just an empty string to put characters into
for i in 0..input-1
  if i is even string[i] = '1'
  else '0'
  end
end
END
=end

def stringy(input)
  string = ''
  for i in 0..input-1
    if i.even?
      string[i] = '1'
    else
      string[i] = '0'
    end
  end
  string
end

puts stringy(4)
puts stringy(0)
puts stringy(9)
puts stringy(100)
puts ''

def stringy2(input)
  string = ''
  input.times do |index|
    #string[index] = '0' if index.even?
    #string[index] = '1' if index.odd?
    index.even? ? string[index] = '1' : string[index] = '0'
  end
  string
end
puts stringy2(4)
puts stringy2(0)
puts stringy2(9)
puts stringy2(100)
puts ''

# Further exploration

def stringy3(input, start = 1)
  string = ''
  input.times do |index|
    #string[index] = '0' if index.even?
    #string[index] = '1' if index.odd?
    if start == 1
      index.even? ? string[index] = '1' : string[index] = '0'
    elsif start == 0
      index.even? ? string[index] = '0' : string[index] = '1'
    end
  end
  string
end
puts stringy3(4, 0)
puts stringy3(0, 0)
puts stringy3(9, 0)
puts stringy3(100, 0)
puts ''
