# easy_4_10.rb
=begin
input: a signed integer (-321, 567)
output: a string version of same with sign ('-321', '+567')

if int > 0 prepend '+'
else
int = int * -1
prepend '-'

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
def signed_integer_to_string(int)

  new_num = ''
  if int > 0
    new_num << '+'
  elsif int < 0
    int = int * -1
    new_num << '-'
  end

  new_num << integer_to_string(int)

end


def signed_integer_to_string(int)
  new_num = ''
  case int <=> 0
  when -1
    new_num << '-'
    int = -int
  when 1
    new_num << '+'
  end
  new_num << integer_to_string(int)
end
=end
def signed_integer_to_string(int)
  return '0' if int == 0
  int > 0 ? '+' + integer_to_string(int) : '-' + integer_to_string(-int)
end


signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
