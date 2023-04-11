# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
p hash.shift # => [:a, "ant"]
p hash # => {:b=>"bear"}

# An easy way to see for ourselves is to add the p method before hash.shift.
# It returns an array of two elements representing the first key/value pair in
# our hash. Consulting the Ruby docs under Hash, it states that it removes this
# key-value pair from the called hash. That means this is a destructive method