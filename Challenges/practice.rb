# Easy_1_8.rb

def count(num, &block)
  block.call(num)
end

p count(5) { |n| n * 2 }
# p count(4)

def count(num)
  yield(num)
end
p count(5) { |n| n * 4} # => 20

def count(num, proc)
  proc.call(num)
end

exponential = proc { |n| n ** 2 }

p count(5, exponential)


def count(num, lambda)
  lambda.call(num)
end

# ranunculus = lambda { |n| "#{n} buttercups!"}
ranunculus =  -> (5) { "#{n} buttercups!"}

p count(5, ranunculus)

 # Phrase.new("don't one testing, one,two,three 'car boys' 'quotes' javascript(*&%*&%^&*^)").word_count

# phrase = "don't one testing, one,two,three 'car boys' 'quotes' javascript(*&%*&%^&*^)"
# p phrase.scan(/\b[\w']+\b/)
# p phrase.downcase.scan(/\w+'?\w+|\w+/)
# p phrase.downcase.scan(/[a-z]+'?[a-z]+|\d+/)
#
#
# p phrase.gsub(/[^a-zA-Z0-9'',]/, '').split(',').map {|str| str.split}.flatten.map {|w| w.gsub(/'(\w*)'/, '\1')}
# p phrase.delete("!.?:").split(',').map {|str| str.split}.flatten.map {|w| w.gsub(/'(\w*)'/, '\1')}
# p phrase.gsub(/\H/, '').split(',').map {|str| str.split}.flatten.map {|w| w.gsub(/'(\w*)'/, '\1')}
# p phrase.scan(/\b\w*\b/).map {|w| w.gsub(/'(\w*)'/, '\1')}
# puts ''
# p phrase.downcase.scan(/[a-z'']+'?[a-z'']+|\d+/).map {|w| w.gsub(/'(\w*)'/, '\1')}.map {|w| w.gsub(/\b'([\w*])\b/, '\1')}
# p phrase.downcase.scan(/[a-z'']+'?[a-z'']+|\d+/).map {|w| w.gsub(/'(\w*)'/, '\1')}.map {|w| w.scan(/'(\w*)/)}
# p phrase.downcase.scan(/[a-z'']+'?[a-z'']+|\d+/).map {|w| w.gsub(/'(\w*)'/, '\1')}.map {|w| w.scan(/\A'(\w*)\Z/)}
#
#
# p phrase.downcase.scan(/[a-z'']+'?[a-z'']+|\d+/).map {|w| w.gsub(/'(\w*)'/, '\1')}.map {|w| w.gsub(/\A'(\w*)\Z/, '\1')}
