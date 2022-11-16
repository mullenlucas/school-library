require_relative '../entities/book'

describe '#title' do
  it 'will retun the correct title' do
    book = Book.new('Metamorfosis', 'Kafka')
    expect(book.title).to eql 'Metamorfosis'
  end
end

describe '#author' do
  it 'will return the correct author' do
    book = Book.new('Metamorfosis', 'Kafka')
    expect(book.author).to eql 'Kafka'
  end
end