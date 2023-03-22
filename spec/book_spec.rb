require_relative './spec_helper'

describe Person do
  context "test book basic method" do
    it "test instance of book" do
      @book = Book.new("Lord of ring", "Tolkien")
      expect(@book).to be_kind_of Book
    end
    it "test book data" do
      @book = Book.new("Lord of ring", "Tolkien")
      expect(@book.title).to eq "Lord of ring"
      expect(@book.author).to eq "Tolkien"
    end
  end
end
