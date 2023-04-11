# What is the return value of reject in the following code? Why?

new_array = [1, 2, 3].reject do |num|
  puts num
end

p new_array

# Accoding to the Ruby docs, the reject method, when used with a
# block, will return an array for all elements which return falsy
# in the block. This will return a new array with all the original
# elements since puts always returns nil