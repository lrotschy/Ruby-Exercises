# medium_10_6.rb

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
#
# input: 3 integers representing angle values
# output: :right, :acute, :obtuse, or :invalid
#
# array with angles
# invalid if any is less than or equal to 0
# invalid if sum is not 180
# right if any? == 90
# acute if all? < 90
# obtuse if any? > 90

def triangle(a, b, c)
  angles = [a, b, c]
  case
  when angles.any? { |x| x <= 0 } || angles.sum != 180  then :invalid
  when angles.any? { |x| x == 90 }                      then :right
  when angles.all? { |x| x < 90 }                       then :acute
  when angles.any? { |x| x > 90 }                       then :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
