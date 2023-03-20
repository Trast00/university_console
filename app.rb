require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @list_book = []
    @list_person = []
  end

  def show_list_book(with_index: false)
    return puts 'List book empty' if @list_book.empty?

    @list_book.each_with_index do |book, index|
      print "#{index}) " if with_index
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    puts 'Information of the new book'
    title = get_input('Title: ', String)
    author = get_input('Author: ', String)
    @list_book << Book.new(title, author)
    puts 'Book created successfully'
  end

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
end
