# 5_5.rb

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

p color_valid('blue')
p color_valid('green')
p color_valid('pink')
p color_valid('orange')

def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid('blue')
p color_valid('green')
p color_valid('pink')
p color_valid('orange')
