=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Given this code, what would be the final values of a and b?
Input: 
Output: 
Rules: (Also clarifies edge cases and questions)
  - 


EXAMPLES:



DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - a points to immutable object 2
  - b points to mutable array object with immutable 5 and 8
  - arr points to new array with references to values pointed to by a and b
    (They aren't pointing to the variables, just the same object in memory)
  - first element of array is reassigned to 4. This doesn't impact the variable a
    (Element assignment mutates the object, not the element)
  - first element of second element is decremented by 2. This does impact variable b
    (We're mutating the array here)
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
