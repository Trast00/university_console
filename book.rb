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
end

@list_book = []
def show_list_book(with_index: false)
  return puts 'List book empty' if @list_book.empty?

  @list_book.each_with_index do |book, index|
    print "#{index}) " if with_index
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

def create_book
  puts 'Information of the new book'
  title = get_input('Title: ', String)
  author = get_input('Author: ', String)
  @list_book << Book.new(title, author)
  puts 'Book created successfully'
end
