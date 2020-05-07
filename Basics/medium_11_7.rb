# medium_11_7.rb

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# use time::friday? method to check each of 1..12 dates in year
# if true sum += 1

def friday_13th(year)
  sum = 0
  (1..12).each do |month|
    sum += 1 if Time.local(year, month, 13).friday?
  end
  sum
end



p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

def how_many_fridays(year)
  sum = 0
  hash = {
    1 => [31, 0],
    2 => [28, 0],
    3 => [31, 0],
    4 => [30, 0],
    5 => [31, 0],
    6 => [30, 0],
    7 => [31, 0],
    8 => [31, 0],
    9 => [31, 0],
    10 => [31, 0],
    11 => [30, 0],
    12 => [31, 0]
  }
  # if leapyear?(year) hash[2] = 29

  hash.keys.each do |month|
    (1..(hash[month][0])).each do |day|
      hash[month][1] += 1 if Time.local(year, month, day).friday?
    end
  end
  hash
end

p how_many_fridays(2018)

require 'date'
def fridays(year)
  count = 1
  Date.new(year, 1, 1).upto(Date.new(year, 12, 31)) do |day|
    count += 1 if day.friday?
  end
  count
end
p fridays(2018)
