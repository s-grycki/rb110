=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Determine the total age of just the male members of the family.
Input: 
Output: 
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - 
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

males = munsters.select { |_, info| info['gender'] == 'male' }
ages = []
males.each { |_, info| ages << info['age'] }
p ages.sum

age = 0
males = munsters.select { |_,hash| hash['gender'] == 'male' }
males.each { |_,hash| age += hash['age'] }
p age

total_male_age = 0
munsters.each_value do |hash|
  total_male_age += hash['age'] if hash['gender'] == 'male'
end

p total_male_age
