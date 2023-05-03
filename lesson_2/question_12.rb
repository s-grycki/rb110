=begin
Problem: Without using Array#to_h, return a hash where key is the first item in each sub array
and the value is the second item

-Input: Nested array
-Output: Hash

-Rules:
- No using Array#to_h (otherwise it would work simply as is)

Algorithm:
Iterate through the outer array (each_with_object({}))
  SET [sub_array[0]] = sub_arr[1]

Code:
=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# Would work since a double nested array converts to a hash
p arr.to_h

p (arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1] 
end)