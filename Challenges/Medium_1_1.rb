# Medium_1_1.rb

# input: a number, either integer or string up to 16 + 8 + 4 + 2 + 1 = 31
# output: the binary representation of the number translated to handshake code in array
# places in binary numbers:
#
# 0 = 2 ** 0 = 1 = wink
# 1 = 2 ** 1 = 2 = double blink
# 2 = 2 ** 2 = 4 = close your eyes
# 3 = 2 ** 3 = 8 = jump
# 4 = 2 ** 4 = 16 = reverse order of operations
#
# Set reverse to false
# Init result array
# Convert input to integer if necessary
# [16, 8, 4, 2]
#
# Divide number by 16. if 1, reverse order of rest = true
# Divide remainder by 8. if
# 1, add jump
# Divide remainder by 4. if 1, add close your eyes
# Divide remainder by 2. If 1, add double blink
# If remainder = 1, wink

# return array



class SecretHandshake
  MOVES = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(num)
    @num = num.digits(2).map { |dig| dig.to_s } if num.is_a?(Integer)
    @num = num.chars.reverse if num.is_a?(String)
  end

  def commands
    return [] if @num.any? { |dig| dig.match? (/[^01]/) }
    cmds = []
    (0..3).each { |idx| cmds << MOVES[idx] if @num[idx] == '1' }
    @num[4] == '1' ? cmds.reverse : cmds
  end
end


#
# class SecretHandshake
#   def initialize(n)
#     @n = n.to_i
#   end
#
#   def commands
#     commands = []
#     rev = false
#
#     rev = true if @n / 16 == 1
#     commands << 'jump' if (@n % 16)/8 == 1
#     commands << 'close your eyes' if (@n % 8) / 4 == 1
#     commands << 'double blink' if (@n % 4) / 2 == 1
#     commands << 'wink' if (@n % 2) == 1
#     rev == true ? commands : commands.reverse
#   end
# end

# p SecretHandshake.new(5).n
# p SecretHandshake.new('5').n
# p SecretHandshake.new(31).n
# p SecretHandshake.new(17).n
# p SecretHandshake.new('16').n
#
#
#
#
#
#
# p SecretHandshake.new(5).commands
# p SecretHandshake.new('5').commands
# p SecretHandshake.new(31).commands
# p SecretHandshake.new(17).commands
# p SecretHandshake.new('16').commands







require 'minitest/autorun'
# require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_handshake_1_to_wink
    handshake = SecretHandshake.new(1)
    assert_equal ['wink'], handshake.commands
  end

  def test_handshake_10_to_double_blink
    # skip
    handshake = SecretHandshake.new(2)
    assert_equal ['double blink'], handshake.commands
  end

  def test_handshake_100_to_close_your_eyes
    # skip
    handshake = SecretHandshake.new(4)
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    # skip
    handshake = SecretHandshake.new(8)
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    # skip
    handshake = SecretHandshake.new(3)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    # skip
    handshake = SecretHandshake.new(19)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    # skip
    handshake = SecretHandshake.new(31)
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('1')
    assert_equal ['wink'], handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('100')
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('101')
    assert_equal ['wink', 'close your eyes'], handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('11100')
    assert_equal ['jump', 'close your eyes'], handshake.commands
  end

  def test_invalid_handshake
    # skip
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end
