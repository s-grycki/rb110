=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Given this previously seen family hash, 
print out the name, age and gender of each family member:
Input: 
Output: 
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:
(Name) is a (age)-year-old (male or female).


DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over each key/value pair in munster hash
    - print out the values
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
end
