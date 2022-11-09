require_relative '../operations/nameable'
require_relative '../operations/decorator'
require_relative '../operations/capitalize_dc'
require_relative '../operations/trim_dc'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age
  attr_writer :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
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

  def create_rental(rental)
    Rental.new(date, self, person)
  end

  private

  def of_age?
    @age >= 18
  end
end

# testing
person = Person.new(22, 'maximilianus')
puts person.can_use_services? # true
puts person.name
puts person.age

person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
