require './student'
require './teacher'
require './book'
require './rental'

@list_person = []
@list_book = []

def convert_data(data, type)
  data = data.to_i if data.match?(/\A\d+\z/)
  data = data.to_s if type == String
  data
end

def get_input(message, type, between_values = [])
  data = ''
  until data.is_a?(type) &&
        (type == String ? !data.empty? : true) &&
        (between_values.empty? || between_values.include?(data))
    print message
    data = gets.chomp
    data = convert_data(data, type)
  end
  data
end

def show_list_book(with_index: false)
  return puts 'List book empty' if @list_book.empty?

  @list_book.each_with_index do |book, index|
    print "#{index}) " if with_index
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

def show_list_person(with_index: false)
  return puts 'List person empty' if @list_person.empty?

  @list_person.each_with_index do |person, index|
    status = (person.is_a?(Student) ? '[Student]' : '[Teacher]')
    print "#{index}) " if with_index
    puts "#{status} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def show_rental_by_id
  person_id = get_input('ID of person: ', Integer)
  person = @list_person.find do |element|
    element.id == person_id
  end

  return print 'This person ID do not exist' unless person

  puts "Rentals: #{person.list_rental.length}"
  person.list_rental.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
end

def create_rental
  puts 'Select a book from the following list by number: '
  show_list_book(with_index: true)
  book_index = get_input('', Integer)
  return print 'Bad value for book id' unless @list_person[book_index]

  puts 'Select a person from the following list by number (not id):'
  show_list_person(with_index: true)
  person_index = get_input('', Integer)
  return print 'Bad value for person id' unless @list_person[person_index]

  date = get_input('Date: ', String)

  Rental.new(date, @list_person[person_index], @list_book[book_index])

  puts 'Rental successfully created'
end

def create_book
  puts 'Information of the new book'
  title = get_input('Title: ', String)
  author = get_input('Author: ', String)
  @list_book << Book.new(title, author)
  puts 'Book created successfully'
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

def open_option(option_number)
  case option_number
  when 1 then show_list_book
  when 2 then show_list_person
  when 3 then create_person
  when 4 then create_book
  when 5 then create_rental
  when 6 then show_rental_by_id
  end
end

def main
  option = 0
  until option == 7
    puts "\n\n1- List all books"
    puts '2- List all people'
    puts '3- Create a person'
    puts '4- Create a book'
    puts '5- Create a rental'
    puts '6- List all rentals for a given person id'
    puts '7- Exit'
    option = gets.chomp.to_i
    open_option(option)
  end
  print 'Thank you for using this app!'
end

main