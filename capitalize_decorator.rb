require './correct_nameable'
class CapitalizeDecorator < CorrectNameable
  def correct_name
    name = @person.correct_name.strip
    name[0].upcase + name[1..name.length]
  end
end
