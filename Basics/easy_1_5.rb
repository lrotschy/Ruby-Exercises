# easy_1_5.rb

def reverse_sentence(sentence)
  array = sentence.split
  reversed_array = []
  for i in 0..array.length-1 do
    reversed_array.push(array.pop)
  end
  reversed_array.join(' ')
end

sentence = 'I love Brookie!'

puts reverse_sentence(sentence)
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'



def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence(sentence)
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
