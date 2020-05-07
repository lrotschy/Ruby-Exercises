# easy-5_7.rb

=begin
input: a string with one or more words
output: a hash showing the number of words of different sizes
rules:
words are any string of letter delimited by a space
hash = {word_length = number_of_words}

word.count(a..z)

create a second method: remove characters (string)
word_array = string.split
new_array = []
word_array.each do |word|
  new_word = ''
  word.chars.each do \ch|
    if ('a'..'z').include?(ch)
      new_word << ch
    end
  end
  new_array.push(new_word)
end
new-array

=end

def remove_characters(string)
  word_array = string.split
  new_array = []
  word_array.each do |word|
    new_word = ''
    word.chars.each do |ch|
      if ('A'..'z').include?(ch)
        new_word << ch
      end
    end
    new_array.push(new_word)
  end
  new_array
end

p remove_characters("blah's light 3rd")
p remove_characters("what's up?")
p remove_characters('Four score and seven')

def word_sizes(string)
  word_array = remove_characters(string)
  word_sizes_hash = Hash.new(0)
  word_array.each do |word|
    length = word.length
    word_sizes_hash[length] += 1
  end
  word_sizes_hash
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
