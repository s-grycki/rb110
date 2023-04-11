# Given the array below, turn it into a hash where names are keys and 
# positions in the array are values

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Using each_with_index - returns original array
hash = {}
flintstones.each_with_index do |name, idx|
  hash[name] = idx
end

p hash

# Using each_with_object - returns given object
idx = 0
flintstones_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = idx
  idx += 1
end

p flintstones_hash



# I would use each_with_index here due to less complexity. This allows us to
# mutate the originally initialized hash. each_with_object requires us to assign
# the return value to a new variable and manutally assign an index value not actually
# connected to the original array index values