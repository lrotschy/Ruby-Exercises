# Medium_1_6.rb
#
# def convert_to_base_8(n)
#   n.method_name.method_name # replace these two method calls
# end
#
# # The correct type of argument must be used below
# base8_proc = method(argument).to_proc
#
# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8, 10, 12, 14, 16, 33].map(&a_proc)



[10, 12, 14, 16, 20, 41]

def convert(n)
  first_digit = (n / 8) * 10
  second_digit = (n % 8)
  first_digit + second_digit
end
p [8, 10, 12, 14, 16, 33].map { |n| convert(n)}

base8_proc = proc { |n| convert(n) }
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

def convert_to_base_8(n)
  n.to_s(8).to_i
end
base8_proc = method(:convert_to_base_8).to_proc
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
