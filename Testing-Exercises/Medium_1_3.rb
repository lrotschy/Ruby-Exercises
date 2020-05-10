# Medium_1_3.rb

items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end

def gather(items, &block)
  block.call(items)
end

gather(items) do |array|
  puts "Let's start gathering food."
  puts "#{array.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

def gather2(items)
  yield(items) if block_given?
end

gather2(items) do |array|
  puts "Let's start gathering food."
  puts "#{array.join(', ')}"
  puts "Nice selection of food we have gathered!"
end
