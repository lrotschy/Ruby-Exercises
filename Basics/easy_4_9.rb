# easy_4_9.rb

=begin
input: an integer
output: a string representation of the integer

loop
break if number / multiple == 0 && number % multiple == 0
find quotient of number by multiple
use hash to convert to string
Nope.

create empty string

loop do
convert quotient of integer.
append/concatenate to empty string.
int /= int/10
break if int == 0
end
new string.reverse

string methods that are
  mutating but don't end with !: concat, <<, prepend, insert, replace..? but I think thtat's variable assingment? Nope--same id #,

end with ! and don't have a non-mutating counterpart: none?

array and hash methods delete, delte if, delete at, unshift, pop, push, <<, update? 
any methods that change object within the array or hash are mutating but are not marked with !
=end

=begin
def integer_to_string(int)

  convert_to_s = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9'
  }

  new_num = ''

=end
=begin
  loop do
    new_num << (convert_to_s[int % 10])
    int = int / 10
    break if int == 0
  end
=end

=begin
  while
    new_num << (convert_to_s[int % 10])
    int = int / 10
    break if int == 0
  end
=end
#  new_num.reverse!

=begin
  loop do
    remainder, str = int.divmod(10)
    new_num.prepend(convert_to_s[str])
    int = remainder
    break if int == 0
  end
  new_num
end



p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
=end
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)

  new_num = ''

  loop do
    remainder, str = int.divmod(10)
    new_num.prepend(DIGITS[str])
    int = remainder
    break if int == 0
  end
  new_num
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
=begin
  counter = 1
  div = 10 ** counter
  previous = 10 ** (counter - 1)
  num_string = ''
  p counter
  p div
  p previous
  p num_string

  loop do
    #break if int/div == 0

    if counter == 1
      p convert_to_s[int % div]
      num_string.push(convert_to_s[int % div])
    else
      num_string.push(convert_to_s[(int % div) - (int % previous)])
    end
    counter += 1
  end
  num_string
end


p integer_to_string(5)

#  p integer_to_string(4321) == '4321'
#  p integer_to_string(0) == '0'
#  p integer_to_string(5000) == '5000'
=end
=begin
  counter = 1
  current = 10 ** counter
  previous = 10 ** counter - 1
  str = ''

  loop do
    break if counter == 10  #int / current == 0

    if counter == 1
      p convert_to_s[int % current]
      str += convert_to_s[int % current]
    else
      p convert_to_s[int % current]
      str += convert_to_s[(int % current) / previous]
    end
    binding.pry
    counter += 1
    p str
  end
  str.reverse
end
=end
