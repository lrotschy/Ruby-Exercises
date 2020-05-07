# easy_5_2.rb
#create a method that takes minutes as input. negative minutes is time before midnight. positive is time after. Return ime in 24 hour formal. Can't use Date and Time classes.
# input = positive or negative integer (minutes)
# output = time in 24 hour format as function of midnight plus minutes
require 'pry'
require 'pry-byebug'

MINS_PER_DAY = 1440
MINS_PER_HOUR = 60

def time_of_day(minutes)
  remainder = minutes % MINS_PER_DAY
  mins = (remainder % MINS_PER_HOUR).to_s
  mins = mins.prepend('0') if mins.size == 1
  hours = (remainder / MINS_PER_HOUR).to_s
  hours = hours.prepend('0') if hours.size == 1
  time = "#{hours}:#{mins}"
end

p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"
