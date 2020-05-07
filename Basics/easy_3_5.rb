# easy_3_5.rb

def multiply(num1, num2)
  num1 * num2
end


def square(num)
  multiply(num, num)
end

p square(5)
p square(-8)
p square(0)

def to_the_power(num, power)
  return 1 if power == 0
result = 1
  power.times do
    #result *= num
    result = multiply(num, result)
  end
  result
end

p to_the_power(2, 3)
p to_the_power(3, 2)
p to_the_power(4, 4)

# Xullnn's solution:
def power(x, n)
  if n == 1
    x
  else
    x = x * power(x, n - 1)
  end
end
p power(3,2)

def power(x, n)
  if n == 1
    x
  else
    x = multiply(x, power(x, n-1))
  end
  
end
p power(2, 3)
p power(3, 2)
p power(4, 4)
