# Easy_2_1.rb

def step(starting, ending, increment)
  current_number = starting
  return_values = []
    loop do
      return_values << yield(current_number)
      current_number += increment
      break if current_number > ending
    end
  return_values
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
p step(5, 100, 5) { |value| value * 100 }
