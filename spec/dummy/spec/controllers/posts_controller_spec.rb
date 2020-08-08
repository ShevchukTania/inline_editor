require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  let!(:post) { FactoryBot.create(:post, title: 'second title', about: 'Research') }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #inline_update' do
    it 'returns http success for title' do
      put :inline_update, params: { id: post.id, post: { title: 'third' }, format: 'json' }
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for about' do
      put :inline_update, params: { id: post.id, post: { about: 'News' }, format: 'json' }
      expect(response).to have_http_status(:success)
    end
  end
end
