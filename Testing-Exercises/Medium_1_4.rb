# Medium_1_4.rb

def raptors(array)
  raptors = []
  yield(array)
end

p raptors(%w(raven finch hawk eagle)) {|arr| raptors = arr[2..-1]}

def raptors2(array, &block)
  raptors = []
  block.call(array)
end
p raptors2(%w(raven finch hawk eagle)) {|arr| raptors = arr[2..-1]}

def raptors3(array)
  yield(array)
end

raptors3(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts raptors.join(', ')
end

raven, *finches, hawk = %w(raven finch hawk eagle)
p raven
p finches
p hawk

*raven, finch, hawk = %w(raven finch hawk eagle)
p raven
p finch
p hawk
