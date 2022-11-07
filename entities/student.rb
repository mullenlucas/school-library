require_relative 'Person'

class Student < Person
  attr_accessor :classroom

  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# testing
student = Student.new(24, 'David', true, 'Math')
puts student.play_hooky
puts student.name
puts student.age
