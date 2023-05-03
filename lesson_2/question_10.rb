=begin
Problem: Without modifying the original array, use map to return a new array of identical
structure, but with each integer incremented by 1

-Input: Array of hashes
-Output: New data structure with each hash value incremented by 1

Algorithm:
new_hash = {}
array.map do |hash|
  hash.each { |key,val| new_hash[key] = val + 1 }

Code:
=end

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


p (array.map do |hash|
  hash.each_with_object({}) do |(key,val),new_hash|
    new_hash[key] = val + 1
  end
end)