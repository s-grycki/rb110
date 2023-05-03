=begin
Problem: Using .each, write code to ouput all vowels from the strings

-Input: Hash with array values containing string elements
-Output: A string of vowels from the value elements

Algorithm:
Iterate through each value of the hash (an array)
  for each string in the arrays
    print the total vowels

Code:
=end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |value|
  value.each do |string| 
    string.each_char { |char| puts char if ('aeiou').include?(char) }
  end
end