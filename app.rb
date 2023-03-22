require 'json'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @list_book = []
    @list_person = []
    @list_rental = []
    load_data
  end

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
      parent_permission = true if %w[Y y].include?(parent_permission)
      parent_permission = false if %w[N n].include?(parent_permission)
      @list_person << Student.new(age, name, parent_permission: parent_permission)

    elsif option == 2
      specilization = get_input('Specialization: ', String)
      @list_person << Teacher.new(age, name, specilization)
    end
    puts 'Person successfuly created!'
  end

  def show_rental_by_id
    person_id = get_input('ID of person: ', Integer)
    person_rentals = @list_rental.select do |element|
      element.person.id == person_id
    end

    return print 'This person ID do not exist' if person_rentals.empty?

    puts "Rentals: #{person_rentals.length}"
    person_rentals.each do |rental|
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

    @list_rental << Rental.new(date, @list_person[person_index], @list_book[book_index])
    puts 'Rental successfully created'
  end

  def save_data
    list_data = []
    @list_person.each do |person|
      list_data << person.to_json
    end
    File.write('./data/persons.json', JSON.generate(list_data), mode: 'w')

    list_data = []
    @list_book.each do |book|
      list_data << book.to_json
    end
    File.write('./data/books.json', JSON.generate(list_data), mode: 'w')

    list_data = []
    @list_rental.each do |rental|
      list_data << rental.to_json
    end
    File.write('./data/rentals.json', JSON.generate(list_data), mode: 'w')
  end

  def convert_data_person(data)
    person = Student.new(data['age'], data['name'], data['classroom']) if data['type'] == 'student'
    person = Teacher.new(data['age'], data['name'], data['specialization']) if data['type'] == 'teacher'
    person.id = data['id']
    person.parent_permission = data['parent_permission']
    person
  end

  def load_rentals
    return unless File.exist?('./data/rentals.json') && !File.empty?('./data/rentals.json')

    file = File.open('./data/rentals.json')
    list_data = JSON.parse(file.read)

    unless list_data.empty?
      list_data.each do |data|
        book = Book.new(data['book']['title'], data['book']['author'])
        person = convert_data_person(data['person'])
        rental = Rental.new(data['date'], person, book)
        @list_rental << rental
      end
    end

    file.close
  end

  def load_persons_data
    return unless File.exist?('./data/persons.json') && !File.empty?('./data/persons.json')

    file = File.open('./data/persons.json')
    list_data = JSON.parse(file.read)

    unless list_data.empty?
      list_data.each do |data|
        @list_person << convert_data_person(data)
      end
    end

    file.close
  end

  def load_book_data
    return unless File.exist?('./data/books.json') && !File.empty?('./data/books.json')

    file = File.open('./data/books.json')
    list_data = JSON.parse(file.read)
    unless list_data.empty?
      list_data.each do |data|
        @list_book << Book.new(data['title'], data['author'])
      end
    end
    file.close
  end

  def load_data
    load_persons_data
    load_book_data
    load_rentals
  end
end
