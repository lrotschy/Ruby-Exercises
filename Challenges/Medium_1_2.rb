# Medium_1_2.rb

# input: number
# output:
# valid?
# checksum or remainder
# add a digit to make it valid
#
# algorithm
# double every other digit starting from far right [-3, -5...]
# if a digit is over 10 when doubled, subtract 9
#
# checksum = add all digits together
# valid if checksum % 10 == 0

class Luhn
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def addends
    #doubles every other digit
    digits = @num.digits
    1.upto(digits.length - 1).each do |idx|
      if idx.odd? && digits[idx] < 5
        digits[idx] = digits[idx] * 2
      elsif idx.odd? && digits[idx]  >= 5
        digits[idx] = (digits[idx] * 2) - 9
      end
    end
    digits.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    new_luhn = nil
    (0..9).each do |n|
      new_num = num.digits.reverse.push(n).join.to_i
      new_luhn = Luhn.new(new_num)
      break if new_luhn.valid?
    end
    new_luhn.num
  end

end

# luhn = Luhn.new(123)
# p luhn.addends

require 'minitest/autorun'
# require_relative 'luhn'

class LuhnTest < Minitest::Test
  def test_addends
    luhn = Luhn.new(12_121)
    assert_equal [1, 4, 1, 4, 1], luhn.addends
  end

  def test_too_large_addend
    # skip
    luhn = Luhn.new(8631)
    assert_equal [7, 6, 6, 1], luhn.addends
  end

  def test_checksum
    # skip
    luhn = Luhn.new(4913)
    assert_equal 22, luhn.checksum
  end

  def test_checksum_again
    # skip
    luhn = Luhn.new(201_773)
    assert_equal 21, luhn.checksum
  end

  def test_invalid_number
    # skip
    luhn = Luhn.new(738)
    refute luhn.valid?
  end

  def test_valid_number
    # skip
    luhn = Luhn.new(8_739_567)
    assert luhn.valid?
  end

  def test_create_valid_number
    # skip
    number = Luhn.create(123)
    assert_equal 1230, number
  end

  def test_create_other_valid_number
    # skip
    number = Luhn.create(873_956)
    assert_equal 8_739_567, number
  end

  def test_create_yet_another_valid_number
    # skip
    number = Luhn.create(837_263_756)
    assert_equal 8_372_637_564, number
  end
end
