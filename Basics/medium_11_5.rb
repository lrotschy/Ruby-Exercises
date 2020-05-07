# medium_11_5.rb
#
# A triangle is classified as follows:
#
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
#
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
#
# input: 3 numbers a, b, c
# output: type of triangle
# abc to array
# if a, b, c are equal, equilateral
# if any? x, y of a, b, c are equal, then isosceles
# if none? x, y of a, b, c are equal, then scalene
# if abc.sort[2] < [0]+[1] then invalid
# if any abc < 0, then invalid


def triangle(a, b, c)
  array = [a, b, c].sort
  case
  when array.any? { |x| x <= 0 }         then :invalid
  when a == b && b == c                 then :equilateral
  when array[2] > (array[1] + array[0]) then :invalid
  when a == b || b == c || a == c       then :isosceles
  else :scalene
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
