# medium_10_8.rb

# input: number--n--nth fibonacci number
# output: value of n in fibonacci sequence
#
# f(1) = 1
# f(2) = 2
# f(n) = f(n-1) + f(n-2), where n > 2
#
# return 1 if n == 1 || n == 2
# break if n == 1

def fibonacci(n)
  if n == 1 || n == 2
    1
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
