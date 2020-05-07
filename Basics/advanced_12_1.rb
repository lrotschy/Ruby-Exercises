# advanced_12_1.rb

# madlibs
#
# create hash with keys that are parts of speece and values that are arrays of words
#
# create helper method that has part of speech parameter and selects with .sample from hash array
#
# text file has part of speech words placed in text
#
# read file
#
# divide into words with .split .map to new array
#
# if each word == one of hash keys, replace with sample
#
# join new array and return

PARTS_OF_SPEECH = {
  'noun' => ['dog', 'cat', 'bread', 'kite', 'poop', 'puke', 'nose', 'hairball', 'campfire'],
  'pl_noun' => ['toes', 'eyeballs', 'commandos', 'party girls', 'kneecaps', 'fartsicles', 'asshats'],
  'adv' => ['crunchily', 'absurdly', 'creakily', 'with gusto', 'gassily'],
  'adj' => ['crumpled', 'stiff', 'stinking', 'beautiful', 'elegant', 'polka-dotted'],
  'verb' => ['crawl', 'fart', 'jump', 'yell', 'hurl', 'fight']
}

text = File.read('madlib1.txt')

def read_madly_with_variation(txt)
  new = txt.split.map do |word|
    if PARTS_OF_SPEECH.keys.include?(word)
      PARTS_OF_SPEECH[word].sample
    elsif PARTS_OF_SPEECH.keys.include?(word[0..-2])
      PARTS_OF_SPEECH[word[0..-2]].sample << word[-1]
    else
      word
    end
  end
  new.join(' ')
end
p read_madly_with_variation(text)

# def substitute(string)
#   PARTS_OF_SPEECH[string].sample
# end
#
# def read_madly(txt)
#   txt.gsub!('noun', substitute('noun'))
# end
#
# def read_madly_with_variation(txt)
#   new_txt = txt.split(/[!.? ]/)
#   p new_txt
#   new = new_txt.map do |word|
#     if PARTS_OF_SPEECH.keys.include?(word)
#       PARTS_OF_SPEECH[word].sample
#     else
#       word
#     end
#   end
#   new.join(' ')
# end

# def make_madlib(txt)
#   new_txt = txt.split.map do |word|
#     if PARTS_OF_SPEECH.keys.include?(word)
#       PARTS_OF_SPEECH[word].sample
#     else
#       word
#     end
#   end
#   new_txt.join(' ')
# end
#
# p make_madlib(text)


# def mad_lib_format(txt)

# following is what I was going to post
Mine does not use any fancy methods.

``` ruby
PARTS_OF_SPEECH = {
  'noun' => ['dog', 'cat', 'bread', 'kite', 'poop', 'puke', 'nose', 'hairball', 'campfire'],
  'pl_noun' => ['toes', 'eyeballs', 'commandos', 'party girls', 'kneecaps', 'fartsicles', 'asshats'],
  'adv' => ['crunchily', 'absurdly', 'creakily', 'with gusto', 'gassily'],
  'adj' => ['crumpled', 'stiff', 'stinking', 'beautiful', 'elegant', 'polka-dotted'],
  'verb' => ['crawl', 'fart', 'jump', 'yell', 'hurl', 'fight']
}

def read_madly(txt)
  new = txt.split.map do |word|
    if PARTS_OF_SPEECH.keys.include?(word)
      PARTS_OF_SPEECH[word].sample
    elsif PARTS_OF_SPEECH.keys.include?(word[0..-2]) # to handle punctuation
      PARTS_OF_SPEECH[word[0..-2]].sample << word[-1]
    else
      word
    end
  end
  new.join(' ')
end

text = File.read('madlib1.txt')
p read_madly(text)
```
Contents of txt file:
It was a dark and adj night. Two pl_noun walked down a adj road, looking for a place to verb. They saw a house in the distance. A adj woman could be seen through the window, sitting at a table and holding a noun in her hand. The men walked adv to the door and knocked. She opened the door adv and said, 'What do you want?' They said, 'We just want a little noun and a place to verb.'  She slammed the door in their pl_noun and called 911 to report a couple of pl_noun creeping around the neighborhood.
