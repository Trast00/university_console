require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknow', parent_permission = false)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  attr_accessor :classroom
end
