=begin
Problem: Order the following array of hashes based on publication of each book, from
earliest to latest

Algorithm:
iterate through the books array
sort each hash by publish year

Code:
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p (books.sort_by do |book|
  book[:published]
end)