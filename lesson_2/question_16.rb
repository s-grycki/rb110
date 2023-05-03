=begin
Problem: Write a method that returns one UUID when called without parameters

-Rules:
- A UUID is 32 hexidecimal characters long
- A hexidecimal has 16 digit possibilities (0-f)
- A UUID is broken into 5 sections of characters like this: 8-4-4-4-12
- A UUID is represented as a string 

Examples:
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Data Structures:


Algorithm:
SET possible_chars = ('0'..'9' + 'a'..'f')
SET num_array = [8,4,4,4,12]
5.times.with_object([]) do |idx,arr|
  num_array[idx].times do
    arr << (possible_chars).sample
  end.append('-')
end.join.chop

Code:
=end

POSSIBLE_CHARS = ('0'..'9').to_a + ('a'..'f').to_a
NUM_ARRAY = [8,4,4,4,12]

def generate_UUID
  NUM_ARRAY.length.times.with_object([]) do |idx, arr|
    NUM_ARRAY[idx].times do
      arr << POSSIBLE_CHARS.sample
    end
    arr.append('-')
  end.join.chop
end

p generate_UUID