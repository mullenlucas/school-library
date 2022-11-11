require_relative './entities/book'
require_relative './entities/teacher'
require_relative './entities/student'
require_relative './operations/rental'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def run
    user_input = 0
    puts "####\nWelcome to the School Library Ruby App!\n####"
    while user_input != '7'
      puts "Choose a number from the options below:\n"
      app_options
      print 'Enter Option [number]: '
      user_input = gets.chomp
      puts "\n\n"
      check_selection(user_input)
    end
    puts "Exiting, thanks for using this app!\n\n" if user_input == '7'
  end

  def list_all_books
    @books.each do |book|
      puts "Title: '#{book.title}' Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Create a student (1) or a teacher (2)? [Enter the number]:'
    person_selected = gets.chomp
    if person_selected != '1' && person_selected != '2'
      puts 'Invalid option'
    else
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp

      case person_selected
      when '1'
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        print 'Please enter a classroom: '
        classroom = gets.chomp
        person = Student.new(age, name, parent_permission, classroom)
      when '2'
        print 'Specialization: '
        specialization = gets.chomp
        person = Teacher.new(age, name, true, specialization)
      end
    end

    @people << person

    puts "#{person.name} created successfully" if @people.include?(person)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)

    @books << book
    puts "Book '#{title}' by #{author} created successfully" if @books.include?(book)
  end

  def create_rental
    if @books.empty?
      puts 'Please create a book first (option 4).'
    elsif @people.empty?
      puts 'Please add a person first (option 3).'
    else
      puts 'Select a book from this list by number'
      @books.each do |book|
        puts "#{@books.find_index(book)} - #{book.title}"
      end
      selected_book = gets.to_i
      print 'Date: '
      date = gets.chomp
      puts 'Select a person from this list by number'
      @people.each do |person|
        puts "#{@people.find_index(person)} - #{person.name}"
      end
      selected_person = gets.to_i

      rental = Rental.new(date, @books[selected_book], @people[selected_person])

      @rentals << rental
      puts 'Rental created successfully' if @rentals.include?(rental)
    end
  end

  def list_all_rentals_person_id
    list_all_people
    print 'Person ID: '
    person_id = gets.to_i
    puts(@rentals.map do |rental|
      if rental.person.id == person_id
        "Rentals:\nDate: #{rental.date}  Book: #{rental.book.title}"
      else
        'No rentals found for this person'
      end
    end)
  end
end
