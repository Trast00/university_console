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

@list_person = []

def show_list_person(with_index: false)
  return puts 'List person empty' if @list_person.empty?

  @list_person.each_with_index do |person, index|
    status = (person.is_a?(Student) ? '[Student]' : '[Teacher]')
    print "#{index}) " if with_index
    puts "#{status} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person
  print 'Do you want to create studen (1) or a teacher (2)? [Input the number]: '
  option = gets.chomp.to_i

  return create_person if option != 1 && option != 2

  age = get_input('Age: ', Integer)
  name = get_input('Name: ', String)

  if option == 1
    parent_permission = get_input('Parent Persion [Y/N]: ', String, %w[Y N y n])
    @list_person << Student.new(age, name, parent_permission: parent_permission)

  elsif option == 2
    specilization = get_input('Specialization: ', String)
    @list_person << Teacher.new(age, name, specilization)
  end
  puts 'Person successfuly created!'
end
