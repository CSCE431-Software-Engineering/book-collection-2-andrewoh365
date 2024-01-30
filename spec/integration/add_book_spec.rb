require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe 'POST /books' do
    context 'with invalid parameters' do
      it 'does not create a book and re-renders the new template' do
        post books_path, params: { book: { title: '' } }

        expect(Book.count).to eq(0)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Title can&#39;t be blank') # Corrected expectation
      end
    end
  end
end
