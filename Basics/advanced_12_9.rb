
# array = [Rational(1, 2), Rational(2, 1)]
# p array.sum < 3
require 'pry'
require 'pry-byebug'

def egyptian(num)
counter = 1
rationals = []

loop do
  # binding.pry
  next_frac = Rational(1, counter)
  if rationals.sum + next_frac <= num
    rationals.push(next_frac)
  end
  counter += 1
  break if rationals.sum >= num
end
rationals.map { |rat| rat.denominator }
end

p egyptian(Rational(1, 1))
p egyptian(Rational(2, 1))
p egyptian(Rational(3, 1))
p egyptian(Rational(20, 1))
p egyptian(Rational(725, 1))

def unegyptian(denominators)
  fractions = denominators.map { |d| Rational(1, d)}
  fractions.sum
end

p unegyptian(egyptian(Rational(1, 1)))
p unegyptian(egyptian(Rational(2, 1)))
p unegyptian(egyptian(Rational(3, 1)))

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
# def egyptian(num)
#   denom = 1
#   denominators = []
#
#   loop do
#     current_num = Rational(1, denom)
#     if num - current_num >= 0
#       num -= current_num
#       denominators.push(denom)
#     end
#     denom += 1
#     break if num <= 0
#   end
#   denominators
# end
# p egyptian(Rational(1, 1))
# p egyptian(Rational(2, 1))
# p egyptian(Rational(3, 1))
