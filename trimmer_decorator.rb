require './correct_nameable'
class TrimmerDecorator < CorrectNameable
  def correct_name
    @person.correct_name.length > 10 ? @person.correct_name[0..9] : @person.correct_name
  end
end
