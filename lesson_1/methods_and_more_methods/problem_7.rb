# What is the BLOCK'S return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?

new_boolean = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

p new_boolean

# The BLOCK'S return value is dependant on the last expression evaluated after
# the method invocation. In this case, we're checking if the argument given to
# each block parameter is odd. This returns true twice, and false once.
# The any? method returns a boolean based on if any element evaluated meets a
# condition. In this case, it does, so the return value is true and it prints
# the first element 1 before short-circuting due to meeting the truthy requirement