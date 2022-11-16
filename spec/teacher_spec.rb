require_relative '../entities/teacher'
require_relative '../entities/person'

describe '#age' do
  it 'will return the correct age' do
    teacher = Teacher.new(50, 'Carlos', true, 'Math')
    expect(teacher.age).to eql 50
  end
end

describe '#name' do
  it 'will return the correct name' do
    teacher = Teacher.new(50, 'Carlos', true, 'Math')
    expect(teacher.name).to eql 'Carlos'
  end
end
