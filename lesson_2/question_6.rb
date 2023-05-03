=begin
Problem: Given the hash, print out the name, age, and gender of each family member

Examples:
(Name) is a (age)-year-old (male or female).

Algorithm:
Iterate over each key/value pair
  print out (key) is a (value['age'])-year-old (value['gender'])

Code:
=end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  puts "#{name} is a #{info['age']}-year-old #{info['gender']}"
end