require './correct_nameable'
class TrimmerDecorator < CorrectNameable
  def correct_name
    @person.correct_name.strip
  end
end
