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

  private

  def of_age?
    @age >= 18
  end
end
