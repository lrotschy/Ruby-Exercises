# easy_2_1.rb

puts "Teddy is #{rand(20..200)} years old!"

def random_age_generator
  puts "Whose age would you like to know?"
  name = gets.chomp
  if name == ''
    puts "Teddy is #{rand(20..200)} years old!"
  else
    puts "#{name} is #{rand(20..200)} years old!"
  end
end

random_age_generator
random_age_generator


def random_age_generator
  puts "Whose age would you like to know?"
  name = gets.chomp
  name = 'Teddy' if name.empty?
  puts "#{name} is #{rand(20..200)} years old!"

end

random_age_generator
random_age_generator
