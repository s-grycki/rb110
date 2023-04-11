# Create a hash that expresses the frequency which each letter occurs in string

statement = "The Flintstones Rock"
statement = statement.delete(' ').split(//)

new_hash = statement.each_with_object({}) do |letter, hash|
  number = statement.count(letter)
  hash[letter] = number
end

p new_hash