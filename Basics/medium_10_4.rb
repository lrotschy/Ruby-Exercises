# medium_10_4.rb

# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
#
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
#
# Example with n = 5 lights:
#
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# input: number = n
# output: array of numbers
# n lights, n repetitions
# light are initially off
# pass = 1, toggle all
# pass = 2, toggle n%2 == 0
# pass = 3, toggle n%3 == 0
# etc.
# which lights are on after n repetitions?
#
# set toggle to false (off)
# make hash 1..n: toggle
# 0..n.each do
#   hash.each do |key, value|
#     if key % n == 0, toggle = !toggle
#   end
# end
# hash.keys.select {value == true}
require 'pry'
require 'pry-byebug'
#
# def lights(n)
#   hash = {}
#   (1..n).each { |x| hash[x] = false }
#
#   (1..n).each do |x|
#
#     hash.each do |key, value|
#       if key % x == 0
#         hash[key] == true ? hash[key] = false : hash[key] = true
#       end
#     end
#
#   end
#   hash.keys.select {|key| hash[key] == true}
# end

def lights(n)
  array = (1..n).map { |x| [x, false] }
  (1..n).each do |pass|
    (0..n-1).each do |index|
      if (index + 1) % pass == 0
        array[index][1] == false ? array[index][1] = true : array[index][1] = false
      end
    end
  end

  on_array = array.select { |inner| inner[1] == true}.map do |elem|
    elem[0]
  end

  off_array =array.select { |inner| inner[1] == false}.map do |elem|
    elem[0]
  end

  puts "Lights #{on_array.join(', ')} are on;"
  puts "lights #{off_array.join(', ')} are off."
end

 p lights(0)
 p lights(1)
p lights(5)
p lights(10)
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
