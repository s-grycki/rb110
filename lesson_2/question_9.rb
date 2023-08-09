=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Given this data structure, return a new array of the same structure but with
the sub arrays being ordered (alphabetically or numerically as appropriate)
in descending order.
Input: Nested array of elements 
Output: Array of same structure with elements in decending order
Rules: (Also clarifies edge cases and questions)
  - Be able to handle string and integer sorting


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - Arrays

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over the outer array (map)
    - Iterate over each inner array (sort)
      - Sort each element with highest values first
=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |subarr|
  subarr.sort { |a,b| b <=> a }
end)
