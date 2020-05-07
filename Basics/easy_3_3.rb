# easy_3_3.rb

=begin
input: ask user for a word or words
output: a sentence telling user how many characters in their input, not including spaces

=end

puts "Please write a word or multiple words: "
input = gets.chomp
compacted_array = []
input.chars.each { |x| compacted_array.push(x) unless x == ' '}
puts "There are #{compacted_array.length} characters in #{input}."

puts "Please write a word or multiple words: "
input = gets.chomp
puts "There are #{input.delete(' ').size} characters in #{input}."


puts "Please write a word or multiple words: "
input = gets.chomp
puts "There are #{input.split.join.length} characters in #{input}."
