# easy_4_4.rb

=begin
input: a year
output: true or false if year was leap year
prior to 1752 any year divisible by 4 was a leap year
after, use method in previous exercise



def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
  end
end
=end
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    case
    when year % 400 == 0 then true
    when year % 100 == 0 then false
    when year % 4 == 0 then true
    else false
    end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(2) == false
p leap_year?(4) == true
p leap_year?(100) == true
p leap_year?(400) == true
