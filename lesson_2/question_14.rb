=begin
Problem: Return an array containing the colors of the fruits and the sizes of the vegetables
given the below data structure. The sizes should be uppercase and colors should be capitalized

-Input: Hash
-Output: Nested array

Algorithm:
iterate through each hash key/value but return an array (select with object [])
  push capitalized colors onto arr if type == fruit
  push uppercase sizes onto arr if type == vegetable

Code:
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

p (hsh.select.with_object([]) do |(_,sub_hsh), arr|
  arr << sub_hsh[:colors].map(&:capitalize) if sub_hsh[:type] == 'fruit'
  arr << sub_hsh[:size].upcase if sub_hsh[:type] == 'vegetable'
end)