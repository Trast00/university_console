require_relative './spec_helper'

describe Person do
  context 'test rental basic method' do
    before(:all) do
      @person = Teacher.new(17, 'doctor', 'time travel')
      @book = Book.new('Lord of ring', 'Tolkien')
      @rental = Rental.new('2020', @person, @book)
    end

    it 'test instance of rental' do
      expect(@rental).to be_kind_of Rental
    end

    it 'test rental data' do
      expect(@rental.date).to eq '2020'
      expect(@rental.person.name).to eq @person.name
      expect(@rental.book.title).to eq @book.title
    end
  end
end
