# easy_5_3.rb
# write two methods that take a time of day and return the number of minutes before or after midnight, respectively. Return a value in the range 0..1439
# don't use date or time methods
# input: a time string
# output: number of minutes before/after midnight

# before_midnight
# take first two digits and convert to i
# 12 - hour = number of hours before after_midnight
# multiply 12- hour * 60 to find minutes
# add last two characters, converted to i, to minutes
#
#
# after_midnight
# take first two digits and convert to i
# multiply by 60 to find number of minutes
# add last two digits.to_i


def after_midnight(str)
  if str[0..1] == '24'
    hour = 0
  else
    hour = str[0..1].to_i
  end
  (hour * 60) + str[3..4].to_i
end

def before_midnight(str)
  return 0 if str[0..1] == '24:00' || str == '00:00'
  base = 24 * 60
  hour = str[0..1].to_i
  minutes = (hour * 60) + str[3..4].to_i
  base - minutes
end

'12' + '12' = '1212'
12 + 12 = 24
p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34')# == 686
p after_midnight('24:00') #== 0
p before_midnight('24:00')# == 0
p after_midnight('00:23')
p before_midnight('00:23')
