class Book
  attr_accessor :title, :author, :list_rental

  def initialize(title, author)
    @title = title
    @author = author
    @list_rental = []
  end

  def add_rental(rental)
    list_rental << rental unless list_rental.include?(rental)
  end

  def to_json
    {
      title: @title,
      author: @book.to_json,
      list_rental: @list_rental
    }
  end
end
