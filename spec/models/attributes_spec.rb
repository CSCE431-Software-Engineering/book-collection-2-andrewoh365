require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'with valid attributes' do
    it 'is valid with all attributes' do
      book = Book.new(title: 'Test Title', author: 'Test Author', price: 25.99, published_date: Date.today)
      expect(book).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without an author' do
      book = Book.new(title: 'Test Title', price: 25.99, published_date: Date.today)
      expect(book).not_to be_valid
    end

    it 'is invalid without a price' do
      book = Book.new(title: 'Test Title', author: 'Test Author', published_date: Date.today)
      expect(book).not_to be_valid
    end

    it 'is invalid without a published date' do
      book = Book.new(title: 'Test Title', author: 'Test Author', price: 25.99)
      expect(book).not_to be_valid
    end
  end
end
