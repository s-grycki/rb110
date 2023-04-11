# Write your own version of the Ruby on Rails titleize method to capitalize
# the start of every word in a string

words = "the flintstones rock"

def titleize(words)
  word_array = words.split
  word_array.each { |word| word.capitalize! }
  word_array.join(' ')
end

p titleize(words)