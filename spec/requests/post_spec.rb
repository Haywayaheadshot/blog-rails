require 'rails_helper'

RSpec.describe PostController, type: :request do
  describe 'GET /index' do
    @route = '/user/1/post'

    it 'returns http index success' do
      get @route
      expect(response).to have_http_status(:success)
    end
    it 'returns http index success' do
      get @route
      expect(response).to render_template(:index)
    end
    it 'ensures the body to include the correct placeholder text' do
      get @route
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET /show' do
    it 'returns http show success' do
      get '/user/1/post/1'
      expect(response).to have_http_status(:success)
    end
    # it 'renders the show template' do
    #   get '/user/1/post/1'
    #   expect(response).to render_template(:show)
    # end
    it 'ensures the body to include the correct placeholder text' do
      get '/user/1/post/1'
      expect(response.body).to include('Hello World')
    end
  end
end
