class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    book.add_rental(self)
    @book = book

    person.add_rental(self)
    @person = person
  end

  def to_json
    {
      date: @date,
      book: @book.to_json,
      person: @person.to_json
    }
  end
end
