# In the array, find the index of the first name starting with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Using each_with_index
flintstones.each_with_index do |name, idx|
  p idx if name.start_with?("Be")
end

# Using index
p flintstones.index { |name| name[0, 2] == "Be" }