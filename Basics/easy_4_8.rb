# easy_4_8.rb

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


def string_to_signed_integer(str)
  convert_to_str = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

  value = value(str)

  integer = 0
  counter = 0
  str = str.reverse

  loop do
    break if counter == str.length
    num = convert_to_str[str[counter]]
    counter == 0 ? integer += num : (integer += (num * (10 ** counter)))
    counter += 1
  end

integer *= -1 if value == 'negative'
integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
