# 3_4.rb

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?('Dino ')
p advice =~ /Dino /
p /Dino /.match(advice)
p advice =~ /dino/
p /dino/.match(advice)
p advice.match("Dino")
