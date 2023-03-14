require './correct_nameable'
class CapitalizeDecorator < CorrectNameable
  def correct_name
    @person.correct_name[0].upcase + @person.correct_name[1..@person.correct_name.length]
  end
end
