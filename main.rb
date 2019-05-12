require 'json'
books_lore = File.read('./core2/elements/books_lore.json')
books_lore_hash = JSON.parse(books_lore)
# puts books_lore_hash['elements'][0]['aspects'] # elements is main hash, enumerated goes through entries in elements, then can pull specific hashes from within an entry

def print_lore_book(id, hash)
  hash['elements'].each do |book|
    puts book['label']+": "+book['description']if book['id'] == id
  end
end

study_1_books = File.read('./core2/recipes/study_1_books.json')
study_1_books_hash = JSON.parse(study_1_books)

def print_study_texts_book(id, hash)
  studyid = "study" + id
  hash['recipes'].each do |recipe|
    puts recipe['label'] + ": Start: " + recipe['startdescription'] + " End: " + recipe['description'] if recipe['id'] == studyid
  end
end

fragments = File.read('./core2/elements/fragments.json')
fragments_hash = JSON.parse(fragments)


def print_lore_frag_id(book_id, hash) # use study_1_books_hash
  # scan_frag_id = nil
  hash['recipes'].each do |recipe|
    if recipe['requirements'].keys[0] == book_id
          scan_frag_id = recipe['effects'].keys[1]
          puts scan_frag_id+" in block"
          return scan_frag_id
    end
  end
  # puts scan_frag_id +" in function"
end

# print_lore_frag_id('dehoris1', study_1_books_hash)

def print_lore_frags_of_aspect(aspect, hash)
  hash['elements'].each do |lore_frag|
    puts lore_frag['label']+": "+lore_frag['description'] if lore_frag['aspects'].has_key? aspect
  end
end

def print_lore_frag_description(frag_id, hash)
  hash['elements'].each do |lore_frag|
    puts lore_frag['label']+": "+lore_frag['description'] if lore_frag['id'] == frag_id
  end
end

# print_lore_frags_of_aspect("grail", fragments_hash)
# print_lore_book('dehoris1', books_lore_hash)
# print_study_texts_book('dehoris1', study_1_books_hash)
frag_id = print_lore_frag_id('dehoris1', study_1_books_hash)
puts frag_id+" not in function"
print_lore_frag_description(frag_id, fragments_hash)
