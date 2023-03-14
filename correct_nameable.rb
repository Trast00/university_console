require './nameable'
# Base decorator for Nameables
class CorrectNameable < Nameable
  attr_accessor :person

  def initialize(person)
    @person = person
    super()
  end

  def correct_name
    @person.correct_name
  end
end
