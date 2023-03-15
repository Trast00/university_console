class Book 
  attr_accessor :title
  attr_accessor :author
  attr_accessor :list_rental
  def initialize(title, author)
    @title = title
    @author = author
    @list_rental = []
  end

  def add_rental(rental)
    list_rental << rental unless list_rental.include?(rental)
  end
end