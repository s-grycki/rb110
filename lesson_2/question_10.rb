=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
without modifying the original array, use the map method to return a new array
identical in structure to the original but where the value of each integer
is incremented by 1.
Input: Array of hashes 
Output: New array of hashes (same structure)
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - Arrays, Hashes

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over the outer array (map)
    - Iterate over each hash
      - Increment each value in the hashes by 1
=end

p ([{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.each_key do |key|
    hash[key] += 1
  end
end)


array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

p (array.map do |hash|
  hash.each_with_object({}) do |(key,val),new_hash|
    new_hash[key] = val + 1
  end
end)
