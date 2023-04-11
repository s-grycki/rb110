# What is the return value of the select method below? Why?

new_array = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p new_array # => [1, 2, 3]

# If it weren't for the string 'hi', then select would return a new
# empty array because all elements from the array being passed into the
# num block parameter evaluate to false. However, with the last 'hi' being
# the final expression evaluated within the block, every element will evaluate
# to true. Therefore, a new array with all the original elements is returned