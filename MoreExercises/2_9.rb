# 2_9.rb

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

array = []

flintstones.each do |key, value|
  if key == "Barney"
    array.push(key)
    array.push(value)
  end
end
p array

easier_way = flintstones.assoc("Barney")
p easier_way
