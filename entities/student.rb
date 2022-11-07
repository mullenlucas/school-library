require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = "Unknown", parent_permission = true, classroom = "None")
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# testing
student = Student.new(24, "David", true, "Math")
puts student.play_hooky
puts student.name
puts student.age