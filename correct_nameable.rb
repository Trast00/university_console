require './nameable.rb'
# Base decorator for Nameables
class CorrectNameable < Nameable
  attr_accessor :person
  def initialize(person)
    @person = person
  end

  def correct_name
    @person.correct_name
  end
end