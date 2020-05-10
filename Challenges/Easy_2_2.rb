# Easy_2_2.rb

class Scrabble
  SCORES = { %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word == nil || @word == ''
    score = 0
    @word.downcase.chars.each do |ch|
      SCORES.each do |key, value|
        score += value if key.include?(ch)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

require 'minitest/autorun'
# require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    # skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    # skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    # skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    # skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    # skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    # skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    # skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    # skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end
