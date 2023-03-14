require './correct_nameable'
class CapitalizeDecorator < CorrectNameable
  def correct_name
    @person.correct_name.upcase
  end
end
