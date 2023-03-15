class Rental
  attr_accessor :date
  attr_accessor :book
  def initialize(date)
    @date =date
    @book = nil
  end

end