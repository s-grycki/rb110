=begin
Problem: Use a combination of methods, including the select/reject method, to return a new
array with only integers that are multiples of 3


Algorithm:
arr.map do |sub_arr|
  sub_arr.select { |int| int % 3 == 0 }

Code:
=end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

p (arr.map do |sub_arr|
  sub_arr.select { |int| int % 3 == 0 }
end)