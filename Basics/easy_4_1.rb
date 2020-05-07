# easy_4_1.rb

=begin
input: two strings of different word_lengths
output: return the result of concatenating short, long, short

START
new_str = ''
if str1.length < str2.length
  new_str << str1 << str2 << str1
else
  new_str << str2 << str1 << str2
end
new_str


=end
=begin
def short_long_short(str1, str2)

new_str = ''

if str1.length < str2.length
  new_str << str1 << str2 << str1 # str1 + str2 + str1
else
  new_str << str2 << str1 << str2
end

new_str
end
=end
def short_long_short(str1, str2)
new_str = ''
str1.length < str2.length ? new_str + str1 + str2 + str1 : new_str + str2 + str1 + str2
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short('Michael', 'Brooke')
