# easy_4_2.rb

=begin
input: integer
output: which century the year is in as a numeric string plus 'th', 'rd', 'st' as appropriate
  - centuries are x01-y00, so 2000 is in the 20th, but 2001 is in the 21st
    1901-2000 = 20th

steps:
1. determine the number of the century
subtract 1
divide number by 100
add 1
i.to_s

2. determine the appropriate ending
1=st
2=nd
3=rd
4=th
5=th
6=th
7=th
8=th
9=th
10=th
teens all th
above 20 use 1-9

if i % 100 == (10..19)
th
elsif i % 10 == (4..9)
th
elsif i%10 == 1
st
elsif i%10 == 2
nd
elsif i%10 == 3
rd
end

=end

def cen(num)
  cen = (((num -1) / 100) + 1)
  cen
end

def ending(num)

  if [11, 12, 13].include?(num % 100)
    return 'th'
  else
    case num % 10
    when 1
      return 'st'
    when 2
      return 'nd'
    when 3
      return 'rd'
    else
      return 'th'
    end
  end
end

def century(num)
  cent = cen(num)
  cent.to_s + ending(cent)
end


p cen(2001) == '21'
p cen(1305) == '14'
p cen(2) == '1'
p cen(31000) == '310'
p ''
p ending(1112) == 'th'
p ending(1111) == 'th'
p ending(1997) == 'th'
p ending(125) == 'th'
p ending(2012) == 'th'
p ending(2001) == 'st'
p ending(2172) == 'nd'
p ending(3443) == 'rd'







p ''
p century(2000) == '20th'
p century(2000)
p century(2001) == '21st'
p century(2001)
p century(1965) == '20th'
p century(1965)
p century(256) == '3rd'
p century(1965)
p century(5) == '1st'
p century(5)
p century(10103) == '102nd'
p century(10103)
p century(1052) == '11th'
p century(1052)
p century(1127) == '12th'
p century(1127)
p century(11201) == '113th'
p century(11201)
p century(1999) == '20th'
p century(1999)
