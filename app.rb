#!C:/Ruby31-x64/bin/ruby.exe

@list_person = []

def listAllBook
  puts "All book listed"
end
def create_person
  print "Do you want to create studen (1) or a teacher (2)? [Input the number]: "
  option = gets.chomp.to_i
  
  return create_person if option != 1 && option != 2
  age = -1
  name = ""

  until age != -1 && age.is_a?(Integer)
    print "Age: "
    age = gets.chomp.to_i
  end

  until !name.empty? && name.is_a?(String)
    print "Name: "
    name = gets.chomp
  end

  if (option == 1)
    parent_permission = nil
    until parent_permission != "Y" && parent_permission != "N"
      print "Parent Persion [Y/N]: "
      parent_permission = gets.chomp
    end
    list_person << Student.new(age, name, parent_permission: parent_permission)

  elsif (option == 2)
    specilization = nil
    until !specilization.empty? && specilization.is_a?(String)
      print "Specialization: "
      specilization = gets.chomp
    end
    list_person << Teacher.new(age, name, specilization)
  end
  puts "Person successfuly created!"
end
def open_option(optionNumber)
  case optionNumber
  when 1 then list_all_Book
  when 2 then list_all_erson
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