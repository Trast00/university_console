require './correct_nameable'
class TrimmerDecorator < CorrectNameable
  def correct_name
    name = @person.correct_name.strip
    name[0..9]
  end
end
