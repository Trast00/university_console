#!C:/Ruby31-x64/bin/ruby.exe
require './student.rb'
require './teacher.rb'
require './book.rb'

@list_person = []
@list_book = []

def get_input(message, type, between_values=[])
  data = ""
  until (data.is_a?(type) && (between_values.empty? || between_values.include?(data)) && (type == String ? !data.empty? : true))
    print message
    data = gets.chomp
    data = data.to_i if data.match?(/\A\d+\z/)
    data = data.to_s if type == String
  end
  data
end

def create_book
  puts "Information of the new book"
  title = get_input("Title: ", String)
  author = get_input("Author: ", String)
  @list_book << Book.new(title, author)
  puts "Book created successfully"
end

def create_person
  print "Do you want to create studen (1) or a teacher (2)? [Input the number]: "
  option = gets.chomp.to_i
  
  return create_person if option != 1 && option != 2
  age = get_input("Age: ", Integer)
  name = get_input("Name: ", String)

  if (option == 1)
    parent_permission = get_input("Parent Persion [Y/N]: ", String, ["Y", "N", "y", "n"])
    @list_person << Student.new(age, name, parent_permission: parent_permission)

  elsif (option == 2)
    specilization = get_input("Specialization: ", String)
    @list_person << Teacher.new(age, name, specilization)
  end
  puts "Person successfuly created!"
end

def open_option(optionNumber)
  case optionNumber
  when 1 then list_all_Book
  when 2 then list_all_person
  when 3 then create_person
  when 4 then create_book
  when 5 then create_rental
  when 6 then list_all_rental_by_id
  end
end

def main
  option = 0
  until option == 7
    puts "1- List all books"
    puts "2- List all people"
    puts "3- Create a person"
    puts "4- Create a book"
    puts "5- Create a rental"
    puts "6- List all rentals for a given person id"
    puts "7- Exit"
    option =  gets.chomp.to_i
    open_option(option)
  end
  print "finish with option: #{option}"
end

main()