require_relative './entities/book'
require_relative './entities/teacher'
require_relative './entities/student'
require_relative './operations/rental'
require_relative './entities/person'

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

 
end
