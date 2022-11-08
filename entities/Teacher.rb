require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(*all, specialization)
    super(*all)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# testing
teacher = Teacher.new(27, 'Alice', 'Physics')
puts teacher.can_use_services? # true
puts teacher.name
puts teacher.age
