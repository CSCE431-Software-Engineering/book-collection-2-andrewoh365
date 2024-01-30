require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe 'POST /books' do
    context 'with valid attributes' do
      it 'creates a new Book with all attributes and redirects to the Book index' do
        post books_path, params: { book: { title: 'New Book Title', author: 'Author Name', price: 19.99, published_date: Date.today } }
        expect(response).to redirect_to(books_path)
        follow_redirect!
        expect(response.body).to include('Book was successfully created.')
      end
    end

    context 'with invalid attributes' do
        it 'does not create a book without an author and re-renders the new template' do
          post books_path, params: { book: { title: 'New Book Title', price: 19.99, published_date: Date.today } }
          expect(Book.count).to eq(0)
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('Author can&#39;t be blank') # Corrected expectation
    end
    end
end
end