require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exist?('./data/people.json')

    object = JSON.parse(File.read('./data/people.json'))
    object.each do |person|
      if person['class'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'], person['specialization'])
        people << teacher
      else
        student = Student.new(person['age'], person['name'], person['parent_permission'], person['classroom'])
        people << student
      end
    end
  end

end