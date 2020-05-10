# Easy_1_2.rb

def compute
  block_given? ? yield : "Does not compute"
end

puts compute
puts compute {'computes'}


def compute2(arg)
  block_given? ? yield(arg) : "Does not compute"
end


puts compute2(1)
puts compute2(1) { |arg| arg + 1 }
puts compute2('string') { |arg| arg }
puts compute2([1, 2, 3]) { |arg| arg * 2 }
