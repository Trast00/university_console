require './correct_namable.rb'
class Capitalizedecorator < CorrectNameable
  def correct_name
    `capitalized #{@person.correct_namable}`
  end
end