=begin
Problem: Given the code, what will be the final values of a and b?
=end

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
p a
p b

=begin
arr is initialized to an array containing the values 2 and [5, 8] for a value of [2, [5,8]].
arr[0] is reassigned to point to the integer 4. It's important to note that arr[0] and a we're
pointing to the integer 2, not directly at each other, so a is unmodified. The index 0 element
in the second array is decremented by 2. In this case, both arr and b are reassigned because
it's an individual array element, and individual array elements are pointing to objects from
inside of a collection. It's important to ask what specific object we are referencing
=end