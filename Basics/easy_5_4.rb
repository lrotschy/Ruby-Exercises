# easy_5_4.rb
=begin
input: a string of words
output: a string of the same words with the first and last letter of each word swapped
rules: at least one word, at least one letter per word, don't change case,
string contains nothing but words and spaces

string.split
string array map do
  word chars map do
    word chars push (word chars 0 unshift)
    word chars shift (word chars[length -1]
    word chars delete_at length -1
  end
end

    first = word chars.shift
    last = word chars.pop
    word chars.unshift last
    word chards.push first
=end
require 'pry'
require 'pry-byebug'
=begin
def swap(string)
  words = string.split
  new_words = words.map do |word|
    if word.size == 1
      word
    else
      new_word = []
      letters = word.chars
      first = letters.shift
      last = letters.pop
      new_word << last << letters << first
      new_word.flatten.join
    end
  end
  new_words.join(' ')
end

def swap(string)
  words = string.split
  words = words.map do |wrd|
    if wrd.length == 1
      wrd
    else
      wrd[0], wrd[-1] = wrd[-1], wrd[0]
      wrd
    end
  end
  words.join(' ')
end

def swap(string)
  words = string.split
  words = words.map do |wrd|
    wrd[0], wrd[-1] = wrd[-1], wrd[0]
    wrd
  end
  words.join(' ')
end
=end

def swap(str)
  str.split.each { |wrd| wrd[0], wrd[-1] = wrd[-1], wrd[0] }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
