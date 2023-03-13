require './person'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services
    true
  end

  attr_accessor :specialization
end