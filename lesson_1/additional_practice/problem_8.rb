# What happens when me modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # => 1, 3
  numbers.shift(1) # => [1], [2]
end

p numbers # => [3, 4]

# Modifying the called object, as opposed to the elements, is considered
# bad practice because it causes unexpected behavior. In the above example,
# we call each on an array with index values 0 - 3. The first pass works as
# expected, but it outputs 3 the second time because this is now index 1.
# Shift then removes element 2 as the new 0 index element. Since the array
# now only has 2 elements, and each has looped 2 times, the program finishes 



# What will be output by the code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # => 1, 2
  numbers.pop(1) # => [4], [3]
end

p numbers # => [1, 2]

# This program works similar to the first one, the difference is that we're
# deleting every final element per loop. This still results in two iterations,
# but with different outputs and returns

# Iterators operate on the original array in real-time