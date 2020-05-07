# easy_1_1.rb

# method to repeat string x number of times
# input: 2 arguments -- a string, a positive integer
# output: the string, as many times as integer indicates
# get strings
# get integer
# put string integer times

def valid_integer?(input)
  (input.to_i.to_s == input)
end
=begin
def repeat(str, int)
  int.to_i.times do
    puts str
  end
end
puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp
repeat(string, integer)

def repeat(str, int)
  int.to_i.times {puts str}
end
puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp
repeat(string, integer)

def repeat(str, int)
  for n in 1..int.to_i do
    puts str
  end
end

puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp
repeat(string, integer)

def repeat(str, int)
  (1..int.to_i).each {|i| puts str}
end

puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp
repeat(string, integer)


def repeat(str, int)
  counter = 1
  puts "counter " + counter.to_s
  loop do
    puts str
    counter += 1
    puts "counter " + counter.to_s
    break if counter == int
  end
end

puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp.to_i
repeat(string, integer)

def repeat(str, int)
  counter = 0
  while counter < int
    puts str
    counter +=1
  end
end

puts 'Give me a word or phrase please:'
string = gets.chomp
puts 'How many times would you like it repeated?'
integer = gets.chomp.to_i
repeat(string, integer)
=end


def repeat(str, int)
  puts "#{str}\n" * int
end

puts 'Give me a word or phrase please:'
string = gets.chomp
int = ''
loop do
  puts 'How many times would you like it repeated?'
  int = gets.chomp
    if valid_integer?(int)
      int = int.to_i
      break
    else
      puts "Give me a positive integer please."
    end
end

repeat(string, int)
