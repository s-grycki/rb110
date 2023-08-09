=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return an array containing the color of fruits and the sizes of vegetables.
Sizes should be uppercase. Colors should be capitalized
Input: Hash of hash values with colors values as an array
Output: Nested array with colors in an array
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Iterate over each hash value
    - Access colors value and capitalize
    - Access sizes value and uppercase
  - Return all values in nested array
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

p (hsh.each_with_object([]) do |(_, hash), array|
  array << hash[:colors].map(&:capitalize) if hash[:type] == 'fruit'
  array << hash[:size].upcase if hash[:type] == 'vegetable'
end)

p (hsh.map do |_, value|
  p (if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end)
end)
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# The second example calls map on hsh, which will return a new array of objects
# that are returned by the block. Selection based behavior is used in the block
# to only return elements that meet the specified criteria and to perform some
# transformation on them


p (hsh.select.with_object([]) do |(_,sub_hsh), arr|
  arr << sub_hsh[:colors].map(&:capitalize) if sub_hsh[:type] == 'fruit'
  arr << sub_hsh[:size].upcase if sub_hsh[:type] == 'vegetable'
end)
