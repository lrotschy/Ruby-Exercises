# easy_6_1.rb

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

=begin

input: a flooat representing an angle
output: a string representing the angle in degrees, minutes, and seconds
rules:
  - a degree is 60 minutes, a minute is 60 seconds
  - (°)(')(")
algorithm:
num/1 = degree
num%100*60/1 = minutes
(num%100*60%1) * 60 = degrees
convert to string
if digits < 2, prepend 0
use string interpolation to create return


num.divmod(1) = degrees, rest
rest * 60.divmod(1) = degrees, rest
rest * 60 = minutes
=end
=begin
def dms(num)
  degrees, rest = num.to_f.divmod(1)
  minutes, rest = (rest * 60).divmod(1)
  seconds = rest * 60
  num_strings = [degrees, minutes, seconds].map do |fl|
    n = fl.to_i.to_s
    n.prepend('0') if n.size < 2
    n = n[0..1] if n.size > 2
    n
  end
  "#{num_strings[0]}°#{num_strings[1]}'#{num_strings[2]}\""
end
=end


DEGREE = "\xC2\xB0"
def dms(num)
  degrees, rest = num.abs.to_f.divmod(1)
  minutes, rest = (rest * 60).divmod(1)
  seconds = rest * 60
  degrees = degrees
  # what follows is four different versions of the same thing
  "#{degrees}#{DEGREE}%.2d'%.2d\"" % [minutes, seconds]

  %(#{degrees}#{DEGREE}%.2d'%.2d\") % [minutes, seconds]

  format(%(#{degrees}#{DEGREE}%.2d'%.2d\") % [minutes, seconds])
=begin
  string = ""
  string << "%.2d" % degrees << DEGREE << "%.2d" % minutes
  string << "'" << "%.2d" % seconds << "\""
  string
=end
end

puts dms(800.034773)
puts dms(720.73)
puts dms(-30) #== %(30°00'00")
p dms(-76.73) #== %(76°43'48")
p dms(-254.6) #== %(254°36'00")
p dms(-93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(-360) #== %(360°00'00") || dms(360) == %(0°00'00")
