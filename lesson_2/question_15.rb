=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return an array which contains only the hashes where all the integers are even
Input: Array of 3 hashes which contain array values of integers 
Output: Array of hashes where all values are even
Rules: (Also clarifies edge cases and questions)
  - Same data structure


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate through outer array to select certain hashes
    - Iterate through hashes to see if all arrays have even integers
      - Iterate through integers in array to check if all are even
  - Return new object of elements with same data structure

=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.map do |hash| # Outer array to perform transformation on each hash
  hash.select do |_, arrays| # Accessing arrays from hashes to select certain ones
    arrays.all? { |int| int.even? } # Checking all ints from arrays
  end
end)
# => [{}, {:b=>[2, 4, 6], :d=>[4]}, {:e=>[8], :f=>[6, 10]}]

# Not exactly what the problem was asking for. map will iterate over each hash
# element in the array and return a new array. Select iterates over each hash
# and will select certain hashes based on the truthiness of the block. The block
# checks if each array contains all even integers. This removes certain elements
# within a hash, without removing the hash itself. This is why my first solution
# gives a slightly off answer, despite being the correct data structure

p (arr.select do |hash| # Accessing hashes from outer array to select certain hashes
  hash.all? do |_, arrays| # Accessing arrays from hashes to see if all meet a criteria
    arrays.all? { |int| int.even? } # Checking all ints from arrays
  end
end)

# Select will iterate over the outer array to select certain hashes which meet
# a truthiness criteria in the block. In this case, we're iterating over each
# inner hash to see if all arrays meet a certain criteria in the hash. All will
# return a boolean based on the truthiness of the block. Here, another all call
# is being made to iterate over each array and check if every integer is even.
# If all integers in every array of a hash are even, then true is returned to
# the select method for that hash




arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.select do |hash|
  hash.values.flatten.all? { |int| int.even? }
end)
