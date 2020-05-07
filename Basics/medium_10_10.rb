

def fibonacci(n)
  if n <= 2
    1
  else
    previous, sum = [1, 1]
    3.upto(n) do
      previous, sum = [sum, previous + sum]
    end
    sum
  end
end

# def fibonacci_last(n)
#   result = fibonacci(n)
#   result.digits[0]
# end

def fibonacci_last(n)
  last = n % 60
  fibonacci(last).digits[0]
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
