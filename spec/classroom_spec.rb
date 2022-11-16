require_relative '../entities/classroom'
require_relative '../entities/student'

describe '#label' do
  it 'will return the correct label' do
    classroom = Classroom.new('Chem')
    expect(classroom.label).to eql 'Chem'
  end
end

describe '#join_to_student' do
  it 'look if the student is joined to the classroom' do
    classroom = Classroom.new('Chem')
    student = Student.new(40, 'Pedro', true, 'Chem')
    classroom.add_student(student)
    expect(classroom.students).to include student
  end
end
