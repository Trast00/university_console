class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    book.add_rental(self)
    @book = book

    person.add_rental(self)
    @person = person
  end
end

def show_rental_by_id
  person_id = get_input('ID of person: ', Integer)
  person = @list_person.find do |element|
    element.id == person_id
  end

  return print 'This person ID do not exist' unless person

  puts "Rentals: #{person.list_rental.length}"
  person.list_rental.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
end

def create_rental
  puts 'Select a book from the following list by number: '
  show_list_book(with_index: true)
  book_index = get_input('', Integer)
  return print 'Bad value for book id' unless @list_person[book_index]

  puts 'Select a person from the following list by number (not id):'
  show_list_person(with_index: true)
  person_index = get_input('', Integer)
  return print 'Bad value for person id' unless @list_person[person_index]

  date = get_input('Date: ', String)

  Rental.new(date, @list_person[person_index], @list_book[book_index])

  puts 'Rental successfully created'
end
