=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Return a UUID when a method with no parameters is called
Input: Method call
Output: String of 5 divided sections 8-4-4-4-12
Rules: (Also clarifies edge cases and questions)
  - Each valid character is hexidecimal (0-f)


EXAMPLES:
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"


DATA STRUCTURES: (Update co-currently with algorithm, if needed)
  - 

<====== THOUGHT PAD ======>

<=========================>


Algorithm: (View as series of steps. Start high level on complex problems and
think about extracting to helper methods)
  - Initialize VALID_CHARS equal to hexidecimals
  - Create an empty string variable (uuid)
  - Iterate for 32 times
    - Generate a random character from VALID_CHARS
    - Add it to uuid
  - Iterate for 4 times
    - Insert hypens at appropriate indexes
  - Return uuid

=end

VALID_CHARS = ('a'..'f').to_a + ('0'..'9').to_a

def uuid_generator
  uuid = ''
  32.times do
    char = VALID_CHARS.sample
    uuid += char
  end
  uuid.insert(8, '-')
  uuid.insert(13, '-')
  uuid.insert(18, '-')
  uuid.insert(23, '-')
  uuid
end


def uuid_generator
  uuid = ''
  sections = [8,4,4,4,12]
  sections.each_with_index do |section, idx|
    section.times { uuid += VALID_CHARS.sample }
    uuid += '-' unless idx >= sections.size - 1
  end
  
  uuid
end



p uuid_generator


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
