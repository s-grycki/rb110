# In the ages hash, remove people with age 100 and greater

# Using each
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each { |name, age| ages.delete(name) if age >= 100 }

p ages

# Using select!
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |_, age| age <= 100 }

p ages

# I would use select! since it involves less logic and doesn't require the key