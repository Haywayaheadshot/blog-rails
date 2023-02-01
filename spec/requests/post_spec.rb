require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create!(id: 4, name: 'Abubakar', posts_counter: 4)
    @post = Post.create!(id: 4, author_id: @user.id, title: 'Test', comments_counter: 4, likes_counter: 5)
    @route = '/user/:user_id/post'
  end
  describe 'GET /index' do
    describe 'Testing GET posts for an user #posts/index' do
      it "expect to have 'ok' status " do
        get @route
        expect(response).to be_successful
      end
      it "renders 'index' template" do
        get @route
        expect(response).to render_template('index')
      end
      it 'should render correct placeholder in index posts page' do
        get @route
        expect(response.body.to_json).to include('Post Index HTML File')
      end
      it 'should render correct placeholder in the page using assert_select' do
        get @route
        assert_select 'h1', 'Post Index HTML File'
      end
    end
  end
  describe 'GET #show' do
  it 'returns a successful response' do
    get '/user/:user_id/post/:id'
    expect(response).to be_successful
  end

  it 'renders the show template' do
    get '/user/:user_id/post/:id/'
    expect(response).to render_template('show')
  end

  it 'includes the --Comment 1-- word in the response body' do
    get '/user/:user_id/post/:id/'
    expect(response.body).to include('Post show HTML File')
  end
end
end
