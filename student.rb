require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknow', classroom = nil, parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    classroom.list_student << self if classroom
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def change_classroom(new_classroom)
    @classroom.list_student.delete(self) if @classroom.list_student.include?(self)

    new_classroom.list_student << self
    @classroom = new_classroom
    @classroom
  end

  def to_json(*_args)
    json = super
    json[:classroom] = @classroom
    json[:parent_permission] = @parent_permission
    json[:type] = 'student'
    json
  end
end
