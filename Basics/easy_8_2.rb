# easy_8_2.rb


# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.
#
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
#
#
#
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!

# input: nothing to begin, collect noun, verb, adjective, adverb from user
# output: a very short story with input interpolated
#
# algorithm
# ask user to input noun/verb/adjective/adverb
# noun/verb/adjective/adverb = gets.chomp
#
# puts a string with input interpolated

def madlib
  puts "Please enter a noun:"
  noun = gets.chomp
  puts "Please enter a verb:"
  verb = gets.chomp
  puts "Please enter an adjective:"
  adjective = gets.chomp
  puts "Please enter an adverb:"
  adverb = gets.chomp

  puts "The #{adjective} #{noun} #{verb}ed #{adverb} down the street."
end

madlib
