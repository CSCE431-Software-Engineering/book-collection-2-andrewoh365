require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'with valid attributes' do
    it 'is valid with a title' do
      book = Book.new(title: 'Test Title')
      expect(book).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a title' do
      book = Book.new(title: nil)
      expect(book).not_to be_valid
    end
  end
end
