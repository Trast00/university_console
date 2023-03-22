require './person'

class Teacher < Person
  def initialize(age, name, specialization = 'Unknow')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json
    json = super
    json["specialization"] = @specialization
    json["type"] = "teacher"
    json
  end

  attr_accessor :specialization
end
