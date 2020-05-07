# easy_9_9.rb

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
#
# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# input: integers...
# output: letter grade corresponding to average of grades
# arguments to array, inject(:+) arguments
# divide result by number of arguments
# use case to determine letter grade

def get_grade(num1, num2, num3)
  average = [num1, num2, num3].inject(:+)/3
  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

def get_grade(num1, num2, num3)
  average = [num1, num2, num3].inject(:+)/3
  case average
  when 0..59   then 'F'
  when 60..69  then 'D'
  when 70..79  then 'C'
  when 80..89  then 'B'
  else              'A'
  end
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"
p get_grade(23, 26, 50)
p get_grade(101, 300, 90)
