require_relative '../entities/student'
require_relative '../entities/person'

describe '#age' do
  it 'will return the correct age' do
    student = Student.new(12, 'Henry', true, 'Python')
    expect(student.age).to eql 12
  end
end

describe '#classroom' do
  it 'will return the correct name' do
    student = Student.new(12, 'Henry', true, 'Python')
    expect(student.classroom).to eql 'Python'
  end
end
