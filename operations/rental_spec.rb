require_relative 'rental'
require_relative '../entities/book'
require_relative '../entities/teacher'

describe Rental do
  context 'When a new book is created it relate the book to a given user'
  it 'should create a rental acording to the information given' do
    book = Book.new('Amor En Los tiempos de Colera', 'Juan')
    teacher = Teacher.new(29, 'Pancho', true, 'spanish')
    rental = Rental.new('01/01/01', book, teacher)
    expect(rental.date).to eq '01/01/01'
    expect(rental.person.name).to eq 'Pancho'
    expect(rental.person.age).to eq 29
    expect(rental.person.parent_permission).to eq true
    expect(rental.person.specialization).to eq 'spanish'
    expect(rental.book.author).to eq 'Juan'
    expect(rental.book.title).to eq 'Amor En Los tiempos de Colera'
  end
end
