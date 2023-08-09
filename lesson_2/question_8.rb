=begin
PROBLEM: (Start with inputs/outputs if confused. 
Read Problem -> See examples -> Ask questionss)
Using the each method, write some code to output
all of the vowels from the strings.
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
  - Set vowel_string to empty string
  - Iterate over each hash value
    - Iterate over each array element (hash value)
      - Iterate over each string character
        - add character to vowel_string if character is a vowel
  - Return vowel_string
=end


hsh = {
  first: ['the', 'quick'], second: ['brown', 'fox'], 
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']
}

vowel_string = ''
hsh.each_value do |array|
  array.each do |string|
    string.each_char do |char|
      vowel_string << char if %w(a e i o u).include?(char)
    end
  end
end
p vowel_string


hsh.each_value do |value|
  value.each do |string| 
    string.each_char { |char| puts char if ('aeiou').include?(char) }
  end
end
