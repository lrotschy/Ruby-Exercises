# Easy_1_4.rb

def divisors(num)

  # 1.upto(num).select { |n| num % n == 0 }
  results = []
  1.upto(num).each do |n|
    break if results.include?(n)
    if num % n == 0
      results.push(n)
      results.push(num / n)
    end
  end
  results
end

p divisors(1)
p divisors(7)
p divisors(12)
p divisors(98)
p divisors(99400891)
