require './Nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :list_rental

  def initialize(age, name = 'Unknown', parent_permission: false)
    @id = rand(999)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @list_rental = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @list_rental << rental unless list_rental.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
