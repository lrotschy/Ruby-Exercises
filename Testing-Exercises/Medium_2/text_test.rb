# text_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    # @text = Text.new(File.read('sample_text.txt'))  # my way
    @file = File.open('sample_text.txt', 'r') #not my way
  end

  def test_swap
    text = Text.new(@file.read) # not necessary my way
    expected = File.read('sample_text.txt').gsub('a', 'e')
    assert_equal(expected, text.swap('a', 'e')) # not my way
    # assert_equal(expected, @text.swap('a', 'e'))  #my way
  end

  def test_word_count
    text = Text.new(@file.read) # not necessary my way
    assert_equal(72, text.word_count)
  end

  def teardown
    @file.close # not necessary my way
    puts "File has been closed? #{@file.closed?}"
  end
end
