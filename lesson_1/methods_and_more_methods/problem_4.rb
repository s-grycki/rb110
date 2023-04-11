# What is the return value of each_with_object in the following code? Why?

new_hash = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p new_hash

# each_with_index returns the initially given object after iterating
# over each element of the called object applying it to the given object.
# In this case, the block is doing key/value assignment to the hash for
# every element in the array based on the first character of each string
# object and the full string object

