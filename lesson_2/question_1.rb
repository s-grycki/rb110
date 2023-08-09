=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
How would you order this array of number strings by
descending numeric value?
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

arr = ['10', '11', '9', '7', '8']

p arr.sort_by { |int| int.to_i }.reverse

p arr.sort { |a,b| b.to_i <=> a.to_i }
