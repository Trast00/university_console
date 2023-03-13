class Person
  def initialize(age, name = 'Unknown', parent_permission: false)
    @id = rand(999)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
