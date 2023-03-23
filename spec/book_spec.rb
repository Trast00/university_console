require_relative './spec_helper'

describe Book do
  context 'test book basic method' do
    before(:all) do
      @book = Book.new('Lord of ring', 'Tolkien')
    end
    it 'test instance of book' do
      expect(@book).to be_kind_of Book
    end
    it 'test book data' do
      expect(@book.title).to eq 'Lord of ring'
      expect(@book.author).to eq 'Tolkien'
    end
    
    it "test to_json methods" do
      expect(@book.to_json[:title]).to eq @book.title  
      expect(@book.to_json[:author]).to eq @book.author
    end
  end
end
