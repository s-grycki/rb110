# How does count treat the block's return value? How can we find out?

new_int = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p new_int

# We could check the documentation for confirmation. For added clarity,
# we could also add a p method to the start of str.length to see what's
# being returned. Under the Enumerable module, it states that count will
# count the number of truthy items in a collection if a block is given.
# In this case, it will return integer 2