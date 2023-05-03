=begin
Problem: Determine the total age of only male members of the family from the hash

Algorithm:
SELECT every value within the munster hash where gender = male
SUM the value within every age key from returned hash

Code:
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Alternate solution
males = munsters.select { |_, info| info['gender'] == 'male' }
ages = []
males.each { |_, info| ages << info['age'] }
p ages.sum



total_ages = 0
munsters.each_value do |info|
  total_ages += info['age'] if info['gender'] == 'male'
end
p total_ages