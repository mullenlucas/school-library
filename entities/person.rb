require_relative '../operations/nameable'
require_relative '../operations/decorator'
require_relative '../operations/capitalize_dc'
require_relative '../operations/trim_dc'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age
  attr_writer :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
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
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name
