=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return a new identical array but with only multiples of 3
Input: Nested array of integers
Output: New nested array with only the multiples
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - Nested arrays

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over outer array (map)
    - Iterate over each element in inner array (select)
      - Check if element is multiple of 3
=end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

p (arr.map do |subarr|
  subarr.select { |int| int % 3 == 0 }
end)
