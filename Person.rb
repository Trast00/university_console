
class Person 
  @id = -1
  def initialize(age, name = "Unknown", parent_permission = false)
    @age = age
    @name = name
    @parent_permission = parent_permission 
  end
  attr_reader :id 
  attr_accessor :name
  attr_accessor :age

  private 
  def is_of_age 
    @age >= 18
  end 

  public 
  def can_use_services 
    @age >= 18 || @parent_permission
  end 


end