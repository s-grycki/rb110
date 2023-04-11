# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
p arr.take(2) # => [1, 2]
p arr # => [1, 2, 3, 4, 5]

# To find this out for ourselves before verifying with the docs, we
# could call the p method on arr.take and arr on the next line. arr.take(2)
# returns a new array of 2 elements starting with index 0. This implies to me
# that it returns a new array with an optional argument of how many elements
# should be included. When we call p arr on the next line, the original array
# is not impacted. This tells me that Array#take is non-destructive. The documents
# under array confirm this mental model