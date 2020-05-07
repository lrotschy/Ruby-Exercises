# 2_6.rb

famous_words = 'seven years ago...'

puts 'prepend'
puts famous_words.prepend('Four score and ')
puts famous_words

puts ''
puts '+'
famous_words = 'seven years ago...'
puts 'Four score and ' + famous_words
puts famous_words

puts ''
puts 'concat'
famous_words = 'seven years ago...'
puts 'Four score and '.concat(famous_words)
puts famous_words

puts ''
famous_words = 'seven years ago...'
puts 'interpolation'
puts "Four score and #{famous_words}"
puts famous_words

puts ''
puts '<<'
famous_words = 'seven years ago...'
puts 'Four score and' << famous_words
puts famous_words
famous_words = 'seven years ago...'
# this doesn't mutate famous words because famous words isn't the caller.
puts ''
famous_words = 'seven years ago...'
puts '<< again'
beginning = 'Four score and '
puts beginning << famous_words
puts beginning
puts famous_words
