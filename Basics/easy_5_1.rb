# easy_5_1.rb

# Determine the sum of the ASCII values of every character in a string
# string#ord determine value of character
# string.chars
# string.chars map ascii values, sum

def ascii_value(str)
  str.chars.map { |x| x.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p 'a'.ord.chr
p '2'.ord.chr
p 'F'.ord.chr
p 'bubble'.chr
p 'Brooke'.chr
p ascii_value('')
