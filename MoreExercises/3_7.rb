# 3_7.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << ["Dino", "Hoppy"]
p flintstones.flatten!

flintstones.push("Liela").push("Michael")
p flintstones
flintstones.concat(%w(Brookie Zeke))
p flintstones.flatten
