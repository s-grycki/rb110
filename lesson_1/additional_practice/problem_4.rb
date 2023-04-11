# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Using each method
min_age = ages["Herman"]
ages.each { |_,age| min_age = age if min_age > age }
p min_age

# Using values.min
p ages.values.min