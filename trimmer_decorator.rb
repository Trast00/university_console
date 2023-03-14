require './correct_nameable'
class TrimmerDecorator < CorrectNameable
  def correct_name
    name = @person.correct_name.strip
    return name[0..10] unless name.length < 10

    name
  end
end
