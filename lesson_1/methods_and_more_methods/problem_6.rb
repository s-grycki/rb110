# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size # => 11

# This demonstrates method chaining. We first call the pop method on
# our array and this destructively returns the final element in our array.
# We then call the size method on the string object 'caterpillar', which
# returns the number of characters in the string. In this case, 11