=begin
Problem: Return an array containing only hashes where all integers are even


Algorithm:
Iterate through each array element(select)
  return hash if hash.values.all?(even)

Code:
=end



arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.select do |hash|
  hash.values.flatten.all? { |int| int.even? }
end)