require_relative './spec_helper'

describe Rental do
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

    it "test to_json methods" do
      expect(@rental.to_json[:date]).to eq @rental.date  
      expect(@rental.to_json[:person]).to eq @rental.person.to_json  
      expect(@rental.to_json[:book]).to eq @rental.book.to_json  
    end
  end
end
