# Easy_1_10.rb
# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
class Integer

  ROMANS = { 1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I' }

  # KEYS = [1000, 500, 100, 50, 10, 5, 1]

#   def to_roman
#     num = self
#     string = ''
#
#     ROMANS.keys.each_with_index do |n, idx|
#       # if index > 0 && num >= ROMANS.keys[index - 1] - n
#       #   string += "#{ROMANS[index -1]}#{ROMANS[index]}"
#
#       if num.divmod(n)[1] >+ ROMANS[ROMANS.keys[idx]]
#         string += ROMANS[KEYS[index + 1]]
#         string += ROMANS[n]
#       else
#         string += ROMANS[n] * num.divmod(n)[0]
#       end
#       num = num.divmod(n)[1]
#     end
#     string
#   end
# end

  ROMANS = { 100 => %w(C CC CCC CD D DC DCC DCCC CM),
             10 => %w(X XX XXX XL L LX LXX LXXX XC),
             1 => %w(I II III IV V VI VII VIII IX)
           }
  def to_roman
    string = ''
    self.digits.each_with_index do |digit, idx|
      next if digit == 0
      string.prepend ROMANS[1][digit - 1] if idx == 0
      string.prepend ROMANS[10][digit - 1] if idx == 1
      string.prepend ROMANS[100][digit - 1] if idx == 2
      string.prepend 'M' * digit if idx == 3
    end
    string
  end

end


require 'minitest/autorun'
# require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    assert_equal 'I', 1.to_roman
  end

  def test_2
    # skip
    assert_equal 'II', 2.to_roman
  end

  def test_3
    # skip
    assert_equal 'III', 3.to_roman
  end

  def test_4
    # skip
    assert_equal 'IV', 4.to_roman
  end

  def test_5
    # skip
    assert_equal 'V', 5.to_roman
  end

  def test_6
    # skip
    assert_equal 'VI', 6.to_roman
  end

  def test_9
    # skip
    assert_equal 'IX', 9.to_roman
  end

  def test_27
    # skip
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48
    # skip
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_59
    # skip
    assert_equal 'LIX', 59.to_roman
  end

  def test_93
    # skip
    assert_equal 'XCIII', 93.to_roman
  end

  def test_141
    # skip
    assert_equal 'CXLI', 141.to_roman
  end

  def test_163
    # skip
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_402
    # skip
    assert_equal 'CDII', 402.to_roman
  end

  def test_575
    # skip
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_911
    # skip
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    # skip
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000
    # skip
    assert_equal 'MMM', 3000.to_roman
  end
end
