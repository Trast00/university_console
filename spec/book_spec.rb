require_relative './spec_helper'

describe Person do
  context 'test book basic method' do
    it 'test instance of book' do
      @book = Book.new('Lord of ring', 'Tolkien')
      expect(@book).to be_kind_of Book
    end
    it 'test book data' do
      @book = Book.new('Lord of ring', 'Tolkien')
      expect(@book.title).to eq 'Lord of ring'
      expect(@book.author).to eq 'Tolkien'
    end
  end
end

describe '#add_rental' do
  let(:person) { Person.new('John') }
  let(:rental) { 'rental' }

  it 'adds rental to list_rental' do
    person.add_rental(rental)
    expect(person.list_rental).to eq([rental])
  end

  it 'does not add rental to list_rental if it already exists' do
    person.list_rental << rental
    person.add_rental(rental)
    expect(person.list_rental).to eq([rental])
  end
end

describe '#to_json' do
  let(:book) { Book.new('The Great Gatsby', 'F.Scott Fitzgerald') }

  it 'returns a hash with title and author keys' do
    expect(book.to_json).to include(:title, :author)
  end

  it 'returns a hash with correct title and author values' do
    expect(book.to_json[:title]).to eq('The Great Gatsby')

    expect(book.to_json[:author]).to eq('F.Scott Fitzgerald')
  end
end
