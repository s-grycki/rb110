=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return a new array with same sub-arrays, but ordered by only taking into
consideration odd numbers
Input: 
Output: 
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
=> [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - 
=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

p (arr.sort_by do |sub_arr|
  sub_arr.select { |num| num.odd? }
end)

# sort_by is called on the nested array. This will sort each array passed into
# the sub_arr parameter according to the block and return a new array with the
# same elements. Select is called on each sub array and this will return a new
# array based on the truthiness of the block. In this case, we're getting back
# arrays which contain only odd integers. This is used as the block return value
# for sort_by and will sort the original elements as if there were only odds
