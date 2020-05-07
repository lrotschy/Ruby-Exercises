# medium_11_1.rb
#
# input: a text file
# output: the longest sentence and the number of words in it
# rules:
#   sentences end in . ! ?
#   words are divided by spaces or sentence enders
#
# sentence_array = split text with enders
# longest_sentence = ''
# sentence_array.each do |sentence|
#   divide into words using split and spaces
#   calculate length of words array
#   if words array is longer than longest sentence, set value of longest sentence to current sentence
# puts longest sentece : {longest sentence}. It has {longest sentence.length} number of words

def longest_sentence(text)
  sentence_array = text.split(/[.?!]/)
  longest_sentence = ''
  sentence_array.each do |sentence|
    if sentence.split.length > longest_sentence.split.length
      longest_sentence = sentence
    end
  end
  puts "Longest sentence = #{longest_sentence}. It has #{longest_sentence.split.length} words."
end

sample = "It has to be today. Today is the day! Why today? It is so sad."
text_sample = File.read('frankie.txt')

longest_sentence(sample)
longest_sentence(text_sample)
