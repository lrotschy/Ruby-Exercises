# 3_1.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.fetch('Spot', 'not included')
puts ages.has_key?('Spot')
puts ages.include?('Spot')
puts ages.key?('Spot')
puts ages.member?('Spot')
puts ages.select { |k, v| k == 'Spot'} # sort of
