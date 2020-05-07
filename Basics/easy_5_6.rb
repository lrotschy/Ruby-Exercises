# easy_5_6.rb
=begin
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.


input: a string with one or more words
output: a hash showing the number of words of different sizes
rules:
words are any string of characters delimited by a space
hash = {word_length = number_of_words}

def word_sizes(string)
  word_array = string.split
  hash = {}
  word_array.each do |word|
    length = word.length
    if hash.keys.include?(length)
      hash[length] += 1
    else
      hash[length] = 1
    end
  end
  hash
end
=end

=begin
def word_sizes(string)
  word_array = string.split
  word_sizes_hash = {}
  word_array.each do |word|
    length = word.length
    if word_sizes_hash.keys.include?(length)
      word_sizes_hash[length] += 1
    else
      word_sizes_hash[length] = 1
    end
  end
  word_sizes_hash
end
=end

def word_sizes(string)
  word_array = string.split
  word_sizes_hash = Hash.new(0)
  word_array.each do |word|
    length = word.length
    word_sizes_hash[length] += 1
  end
  word_sizes_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
