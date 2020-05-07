# 4_8.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters
elephants = munsters.clone
mess_with_demographics(elephants)
p munsters



# Yes, it will have been ransacked. The identity of the hash will not have changed, but the identity of the variables within the hash will have changed. Hashes and arrays are not mutable, but the information saved within them can be changed.
