require 'rails_helper'

RSpec.describe UserController, type: :request do
  describe 'GET /index' do
    @route = '/'
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
      expect(response.body).to include('User Display Image')
    end
  end

  describe 'GET /show' do
    it 'returns http show success' do
      get '/user/1'
      expect(response).to have_http_status(:success)
    end
    it 'returns render template Show' do
      get '/user/1'
      expect(response).to render_template(:show)
    end
    it 'ensures the body to include the correct placeholder text' do
      get @route
      expect(response.body).to include('User Display Image')
    end
  end
end
