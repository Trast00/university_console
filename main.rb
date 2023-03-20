require './get_input'
require './student'
require './teacher'
require './book'
require './rental'

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
