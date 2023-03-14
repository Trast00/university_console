class Nameable
  attr_accessor :person
  def initialize(person)
    @person = person
  end

  def correct_name()
    raise NotImplementedError "#{self.class} has not been initilize"
  end
end
