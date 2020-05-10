# Easy_1_9.rb

class PerfectNumber

  def self.classify(n)
    raise RuntimeError if n <= 0
    factors = (1...n).select { |num| n % num == 0}
    return 'perfect' if factors.sum == n
    return 'deficient' if factors.sum < n
    'abundant'
  end

end

# class PerfectNumber
#
#   def self.classify(n)
#     raise RuntimeError if n <= 0
#     if factors(n).sum == n
#       'perfect'
#     elsif factors(n).sum < n
#       'deficient'
#     elsif factors(n).sum > n
#       'abundant'
#     end
#   end
#
#   def self.factors(n)
#     factors = []
#     (1...n).each do |num|
#       factors << num if n % num == 0
#     end
#     factors
#   end
# end

p PerfectNumber.classify(10)
require 'minitest/autorun'
# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
