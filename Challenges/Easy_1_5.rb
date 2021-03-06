# Easy_1_5.rb
require 'pry'
require 'pry-byebug'
# input: a number n
# output: the sum of all the multiples of particular numbers up to but not including that number
# default to 3, 5, but allow for optional argument of any length

class SumOfMultiples
  attr_accessor :multiples
  def initialize(*multiples)
    @multiples = multiples
    @multiples = [3, 5] if @multiples.empty?
  end

# for 2 through n, select n divisible by any multiples.sum
  def self.to(n)
    SumOfMultiples.new.to(n)
  end

  def to(n)
    mults = (1...n).select do |num|
      multiples.any? { |mult| num % mult == 0 }
    end
    mults.sum
  end
end

require 'minitest/autorun'
# require_relative 'sum_of_multiples'
# binding.pry
class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    # skip
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    # skip
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    # skip
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    # skip
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    # skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    # skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    # skip
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    # skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end
