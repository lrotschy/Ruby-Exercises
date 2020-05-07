# medium_11_2.rb

# input: string
# output: true or false. true if you can spell the word only using each block once--can't use both letters
#
# create array of blocks strings
#
# split string into chars
# for each char, upcase
#   for each block
#     if used letters includes character, return false
#     move letters in block to used letters
#   end
# end
# true
#
# # B:O   X:K   D:Q   C:P   N:A
# # G:T   R:E   F:S   J:W   H:U
# # V:I   L:Y   Z:M
require 'pry'
require 'pry-byebug'

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

# def block_word?(string)
#   used_letters = []
#   value = true
#
#   string.upcase.chars.each do |letter|
#     value = false if used_letters.include?(letter)
#     BLOCKS.each do |block|
#       if block.chars.include?(letter)
#         block.chars.each { |ch| used_letters.push(ch) }
#       end
#     end
#   end
#
#   value
# end

def block_word?(string)
  BLOCKS.none? { |block| string.upcase.count(block) >= 2 }
end

p block_word?('BATCH') #== true
p ''
p block_word?('BUTCH') #== false
p ''
p block_word?('jest') #== true
