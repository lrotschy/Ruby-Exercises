# easy_5_9.rb

=begin
input: a string
output: the original string with duplicate characters removed
rules: can't use squeeze

look at each characters. if previous character is the same, don't concat to new string.
otherwise, concat to new string
new_str = ''
string.chars each_with_index |n, idx|
  if idx == 0
    new_str << n
  elsif string.chars[idx] == string.chars[idx - 1]
    next
  else
    new_str << n
  end
end
new_str
end

=end

def crunch(str)
  new_str = ''
  str.chars.each_with_index do |ch, idx|
    if idx == 0
      new_str << ch
    elsif str.chars[idx] == str.chars[idx - 1]
      next
    else
      new_str << ch
    end
  end
  new_str
end

=begin
set new_str to ''
index = 1
new_str << str[0]
loop do
on each iteration
concat str[index] if string[index -1] != str[index]
index += 1
break if index = str.length
=end

=begin
def crunch(str)
  new_str = ''
  return str if str.length <= 1
  index = 1
  new_str << str[0]

  loop do
    new_str << str[index] if str[index] != str[index - 1]
    index += 1
    break if index == str.length
  end
  new_str
end
=end
=begin
use str.each_char
set new string
if each character is == to new_string[-1] next
else concat char
end
=end
def crunch(str)
  new_str = ''
  str.each_char do |char|
    new_str << char unless new_str[-1] == char
  end
  new_str
end


p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''
p crunch('hello')
