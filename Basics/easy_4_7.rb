# easy_4_7.rb

=begin
convert a string to an integer without using built in methods
input: a numeric string with an optional + or - OR I could READ THE DIRECTIONS!
output: the integer equivalent
how large a number should our method be able to handle?
  ?loop to keep adding zeros?

string.length
sum = 0
counter = 0
loop do
break if counter == string.length
sum += converst[string[counter]] * (10 * counter)
counter += 1
end

, '+' => +, '-' => -
convert = {integer, string elements}
=end


=begin
def string_to_integer(str)
  convert = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

  value = 'positive'

  if str[0] == '+'
    str.delete! "+"
  elsif str[0] == '-'
    str.delete! "-"
    value = 'negative'
  end

  integer = 0
  counter = 0
  str = str.reverse

  loop do
    break if counter == str.length
    num = convert[str[counter]]
    counter == 0 ? integer += num : (integer += (num * (10 ** counter)))
    counter += 1
  end

integer *= -1 if value == 'negative'
integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('456') == 456
p string_to_integer('-456') == -456
p string_to_integer('-1080') == -1080
 string_to_integer('+0010873000') == 10873000
p ''



def value(str)
  value = 'positive'

  if str[0] == '+'
    str.delete! "+"
  elsif str[0] == '-'
    str.delete! "-"
    value = 'negative'
  end

  value
end


def string_to_integer(str)
  convert = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

  value = value(str)

  integer = 0
  counter = 0
  str = str.reverse

  loop do
    break if counter == str.length
    num = convert[str[counter]]
    counter == 0 ? integer += num : (integer += (num * (10 ** counter)))
    counter += 1
  end

integer *= -1 if value == 'negative'
integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('456') == 456
p string_to_integer('-456') == -456
p string_to_integer('-1080') == -1080
 string_to_integer('+0010873000') == 10873000
p ''
=end


=begin
def string_to_integer(str)

  convert = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

  counter = str.length - 1
  value = 0

  str.chars.map do |x|
    value = convert[x] * (10 ** counter) + value
    counter -= 1
  end

value
end



p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('456') == 456
#p string_to_integer('-456') == -456
#p string_to_integer('-1080') == -1080
#p string_to_integer('+0010873000') == 10873000
p ''

=end


def hexadecimal_to_integer(hex)

  convert_to_str = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15,
  }

  counter = hex.length - 1
  value = 0
  hex.upcase!

  hex.chars.map do |x|
    value = (convert_to_str[x] * (16 ** counter) + value)
    counter -= 1
  end

  value
end



p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('1A') == 26
p hexadecimal_to_integer('f00d') == 61453
