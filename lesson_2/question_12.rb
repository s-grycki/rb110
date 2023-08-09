=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return a hash where the key is first item in each sub array and value is second
Input: Nested array with keys and values
Output: Hash with given elements
Rules: (Also clarifies edge cases and questions)
  - Don't use to_h


EXAMPLES:
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over outer array with new hash object
    - Iterate over each inner array
      - Set first value as key
      - Set second value as value
      - Add both to new hash

=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

p (arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end)

