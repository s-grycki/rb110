=begin
Problem: Order the following number array of strings by decending numerical value

Algorithm:
Iterate through the collection and return a new array of integers
call sort and reverse on the array
iterate through the new array and return the string equivelants

Code:
=end

arr = ['10', '11', '9', '7', '8']

p arr.map(&:to_i).sort.reverse.map(&:to_s)

p arr.sort { |a,b| b.to_i <=> a.to_i }
