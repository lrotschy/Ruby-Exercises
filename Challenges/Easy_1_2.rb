# # Easy_1_2.rb  Sieve of Eratosthenes

# input: number
# output: a list of all primes from 2 to number
#
# algorithm:
# start at 2
# find all multiples of 2 up to number and mark as not prime
# take next number not marked as prime
# find all multiples up to number and mark as prime...
# return primes
#
#
# create a hash covering range of numbers from 2 - n
# n = possible_prime
# hash.keys each do |check|
#   hash each do key, value
#     if key > check and key % check == 0
#       key = not_prime
#     end
#   end
# end
# return all keys with possible prime value


require 'pry'
require 'pry-byebug'
class Sieve
  def initialize(n)
    @number = n
    @hash = Hash.new
    (2..n).each do |n|
      @hash[n] = "possible prime"
    end
  end

  def primes
    @hash.keys.each do |check|
      @hash.keys.each do |key|
        if key > check && key % check == 0
          @hash[key] = "not prime"
        end
      end
    end

    @hash.keys.select { |key| @hash[key] == "possible prime"}
  end
end

p Sieve.new(10).primes

require 'minitest/autorun'
# require_relative 'sieve'

class SieveTest < Minitest::Test
  def test_a_few_primes
    expected = [2, 3, 5, 7]
    assert_equal expected, Sieve.new(10).primes
  end

  def test_primes

    expected = [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
      61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
      131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
      193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
      263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331,
      337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401,
      409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
      479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
      569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631,
      641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709,
      719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
      809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
      881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967,
      971, 977, 983, 991, 997
    ]
    assert_equal expected, Sieve.new(1000).primes
  end
end


def primes(n)
  list = (2..n).to_a
  new_list = []
  check = 2

  loop do
    (2..(list.length - 1)).each do |idx|
      new_list << list[idx] unless list[idx] % check == 0 || new_list.include?(list[idx])
    end

    list = new_list
    break if check >= list[-1]
    check += 1
  end
  list
end

p primes(20)
p primes(10)
