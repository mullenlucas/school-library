require_relative '../operations/nameable'
require_relative '../operations/decorator'
require_relative '../operations/capitalize_dc'
require_relative '../operations/trim_dc'

class Person < Nameable
  attr_reader :id, :rentals, :book
  attr_accessor :name, :age
  attr_writer :parent_permission

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def create_rental(book, date)
    Rental.new(date, self, book)
  end

  def self.create_person
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

  end

  private

  def of_age?
    @age >= 18
  end
end
