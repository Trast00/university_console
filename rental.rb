class Rental
  attr_accessor :date
  attr_accessor :book
  attr_accessor :person
  def initialize(date, person, book)
    @date =date

    book.add_rental(self)
    @book = book
    
    person.add_rental(self)
    @person = person
  end

end