require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exist?('./data/people.json')

    object = JSON.parse(File.read('./data/people.json'))
    object.each do |person|
      if person['class'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'], person['specialization'])
        teacher.id = person['id']
        people << teacher
      else
        student = Student.new(person['age'], person['name'], person['parent_permission'], person['classroom'])
        student.id = person['id']
        people << student
      end
    end
  end

  def self.load_books(books)
    return books unless File.exist?('./data/books.json')

    object = JSON.parse(File.read('./data/books.json'))
    object.each do |book|
      book = Book.new(book['title'], book['author'])
      books << book
    end
  end

end
