require_relative '../entities/person'


describe '#age' do
  it 'will return the correct age' do
    person = Person.new(30, 'Diego', parent_permission: true)
    expect(person.age).to eql 30
  end
end

describe '#name' do
  it 'will return the correct name' do
    person = Person.new(30, 'Diego', parent_permission: true)
    expect(person.name).to eql 'Diego'
  end
end