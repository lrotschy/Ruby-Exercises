# medium_10_9.rb

# non-recursive fibonacci
# input: nth number in fibonacci subsequence
# output: value of nth number
#
# n.times do
#   1 if n == 1 or 2
#   fib_array = [1, 1]
#   n-2.times.do fib_array[-1] + fib_array[-2]
#     push to fib array
#   end
#   fib_array[-1]

# def fibonacci(n)
#   1 if n <= 2
#   fib_array = [1, 1]
#   (n-2).times do
#     fib_array.push(fib_array[-1] + fib_array[-2])
#   end
#   fib_array[-1]
# end

# def fibonacci(n)
#   if n <= 2
#     1
#   else
#     sum = 0
#     a = 1
#     b = 1
#     3.upto(n) do
#       sum = a + b
#       a = b
#       b = sum
#     end
#     sum
#   end
# end

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

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
