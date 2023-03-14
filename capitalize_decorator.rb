require './correct_nameable'
class CapitalizeDecorator < CorrectNameable
  def correct_name
    name = @person.correct_name.strip
    name.capitalize
  end
end
