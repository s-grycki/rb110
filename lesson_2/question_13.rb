=begin
Problem: Return a new array with the same sub-arrays, but ordered logically by only taking
into account the odd numbers they contain

Algorithm:
arr.sort_by do |sub_arr|
  arr.select { |int| int.odd? }

Code:
=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

p (arr.sort_by do |sub_arr|
  sub_arr.select { |int| int.odd? }
end)