# easy_5_10.rb
=begin
Write a method that will take a short line of text, and print it within a box.

Example:



input: a short string that will fit in terminal window
output: the string inside a box
rules:
two spaces wide if empty
if text, text.length + 2
corners marked with +
top and bottom with -
sides with |, 3 per side

measure text length
width of inside of box = text length + 2
puts top line with as many dashes as width, + on either end
  print + , width.times print - , puts +
put second line
  print |, print empty spaces as many times as width, print |
put third line
  print |, print space, print text, print space, print |
fourth = second
fifth = first

=end
=begin
def print_in_box(str)
  width = str.length + 2

  print '+'
  (width).times {print '-'}
  puts '+'

  print '+'
  (width).times {print ' '}
  puts '+'

  print '+'
  print ' '
  print str
  print ' '
  puts '+'

  print '+'
  (width).times {print ' '}
  puts '+'

  print '+'
  (width).times {print '-'}
  puts '+'
end
=end
def print_in_box(str)
  str = str[0..76] if str.length > 76
  width = str.length + 2

  first_and_last = "+#{'-' * width}+"
  second_and_fourth = "|#{' ' * width}|"

  puts first_and_last
  puts second_and_fourth
  puts "| #{str} |"
  puts second_and_fourth
  puts first_and_last
end

print_in_box('a;slkdfja;lskdjf;aslkdjf;aslkdjf;alskjdf;asjdf;aklsjdf;alksjdf;askdjf;alksjdf;alskdjf;alskjf;asldkjf;asdlfj')
print_in_box('up')
print_in_box('To boldly go where no one has gone before.')
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end
print_in_box('')
=begin
+--+
|  |
|  |
|  |
+--+
=end
