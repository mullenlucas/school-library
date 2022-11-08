require_relative '../operations/nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age
  attr_writer :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end

# testing
person = Person.new(24, 'David', true)
puts person.can_use_services? # true
puts person.name
puts person.age
