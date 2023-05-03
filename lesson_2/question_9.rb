=begin
Problem: Given the following data structure, return a new array with sub arrays being
ordered appropriately in decending order

Algorithm:
arr.map do |arr|
  arr.sort { |el1,el2| el2 <=> el1 }
end

Code:
=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |arr|
  arr.sort { |element1,element2| element2 <=> element1 }
end)