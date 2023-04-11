# Write code that changes the array below so that all names are shortened
# to just three characters. Do not create a new array

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name.slice(0,3)}