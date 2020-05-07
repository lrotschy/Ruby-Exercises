# easy_4_3.rb

=begin
input: a year
output: return true or false if year is leap year
leap years = every year divisible by 4, unless divisible by 100
if divisible by 100, then not unless divisible by 400

# I see you don't need the "else false" parts below

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    if year % 4 == 0
      true
    else
      false
    end
  end
end

def leap_year?(year)
  case
  when year % 400 == 0 then true
  when year % 100 == 0 then false
  when year % 4 == 0 then true
  else false
  end
end

def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && !(year % 100 == 0))
end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end
=end
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end 
    else
      true
    end
  elsif year % 400 == 0
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
