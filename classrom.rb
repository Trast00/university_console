class Classroom
  attr_accessor :label
  attr_reader :list_student
  def initialize(label)
    @label = label
    @list_student = []
  end

  def add_student(student)
    @list_student << student unless list_student.include?(student)
  end
end
