# easy_2_5.rb Greeating a user

=begin

input: ask for user's name
output: greets user with "Hello" + name + "." If name has an exclamation, greets user with "HELLO" + name + ". WHY ARE WE SCREAMING?"

START
PRINT "What is your name?"
name = gets.chomp
if last character of name string is '!'
PRINT "HELLO" + name + ". WHY ARE WE SCREAMING?"
ELSE
PRINT "Hello #{name}."
END
END
=end

puts "What is your name?"
name = gets.chomp
  if name[-1] == '!'
    puts "HELLO #{name[0...-1].upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end

puts "What is your name?"
name = gets.chomp
  if name[-1] == '!' # if name.chop == '!'
    name.delete! "!" # name = name.chop
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end

# name.delete('!') is better than name[0..-1] because the first deletes all ! characters, and the second only deletes the last character
