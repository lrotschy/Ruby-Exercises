# Medium_1_3.rb
class PigLatin

VOWELS = /\A[aeiou]/
DOUBLES = /\Aqu|ch|th/
TRIPLES = /\Asch|chr|thr|squ/
EXCEPTIONS = /\Axr|yt/

  def self.translate(words)
    piggy_words = []

    words.split.map do |word|
      if (word.match EXCEPTIONS) ||( word.match VOWELS)
        piggy_words << word + 'ay'
      elsif word.match TRIPLES
        piggy_words << word[3..-1] + word[0..2] + 'ay'
      elsif word.match DOUBLES
        piggy_words << word[2..-1] + word[0..1] + 'ay'
      else
        piggy_words << word[1..-1] + word[0] + 'ay'
      end
    end
    piggy_words.join(' ')
  end

end


# class PigLatin
#
# VOWELS_ETC = ['a', 'e', 'i', 'o', 'u']
# COMBOS = ['sch', 'qu', 'ch', 'chr', 'th', 'thr']
# EXCEPTIONS = ['xr', 'yt']
#
#   def self.translate(words)
#     piggy_words = []
#
#     words.split.map do |word|
#       vowel = 'a'
#       if word.match /\A[aeiou]/
#         piggy_words << word + 'ay'
#       elsif word.match /\Asch|chr|thr|squ/
#         piggy_words << word[3..-1] + word[0..2] + 'ay'
#       elsif word.match /\Aqu|ch|th/
#         piggy_words << word[2..-1] + word[0..1] + 'ay'
#       elsif word.match /\Axr|yt/
#         piggy_words << word + 'ay'
#       else
#         piggy_words << word[1..-1] + word[0] + 'ay'
#       end
#     end
#     piggy_words.join(' ')
#   end
#
# end

# p PigLatin.new.translate('apple ear pig chair queen square therapy thrush school yellow yttria xenon xray')
require 'minitest/autorun'
# require_relative 'pig_latin'

class PigLatinTest < Minitest::Test
  def test_word_beginning_with_a
    assert_equal 'appleay', PigLatin.translate('apple')
  end

  def test_other_word_beginning_e
    #skip
    assert_equal 'earay', PigLatin.translate('ear')
  end

  def test_word_beginning_with_p
    #skip
    assert_equal 'igpay', PigLatin.translate('pig')
  end

  def test_word_beginning_with_k
    #skip
    assert_equal 'oalakay', PigLatin.translate('koala')
  end

  def test_word_beginning_with_ch
    #skip
    assert_equal 'airchay', PigLatin.translate('chair')
  end

  def test_word_beginning_with_qu
    #skip
    assert_equal 'eenquay', PigLatin.translate('queen')
  end

  def test_word_with_consonant_preceding_qu
    #skip
    assert_equal 'aresquay', PigLatin.translate('square')
  end

  def test_word_beginning_with_th
    #skip
    assert_equal 'erapythay', PigLatin.translate('therapy')
  end

  def test_word_beginning_with_thr
    #skip
    assert_equal 'ushthray', PigLatin.translate('thrush')
  end

  def test_word_beginning_with_sch
    #skip
    assert_equal 'oolschay', PigLatin.translate('school')
  end

  def test_translates_phrase
    #skip
    assert_equal 'ickquay astfay unray', PigLatin.translate('quick fast run')
  end

  def test_word_beginning_with_ye
    #skip
    assert_equal 'ellowyay', PigLatin.translate('yellow')
  end

  def test_word_beginning_with_yt
    #skip
    assert_equal 'yttriaay', PigLatin.translate('yttria')
  end

  def test_word_beginning_with_xe
    #skip
    assert_equal 'enonxay', PigLatin.translate('xenon')
  end

  def test_word_beginning_with_xr
    #skip
    assert_equal 'xrayay', PigLatin.translate('xray')
  end
end
