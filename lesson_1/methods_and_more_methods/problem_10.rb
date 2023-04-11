# What is the return value of the following code? Why?

new_array = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p new_array # => [1, nil, nil]

# The map method is iterating through each array element and applying
# some operation to them. In this case, the first element is being returned
# within the block. The second and third elements return nil because they're
# being output as values. Therefore, we get the above 3 element array