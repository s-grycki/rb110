# What is the return value of map in the following code? Why?

new_array = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
   value
  end
end

p new_array # => [nil, "bear"]

# Hash#map is transformation behavior, meaning we're applying some
# operation to every element in a collection. However, the if
# statement is adding behavior which returns nil on the first element.
# The default behavior of if statements is to return nil if no condition evaluates
# to true. The second value meets this condition, and is returned as the second 
# element of the array. map will always return an array