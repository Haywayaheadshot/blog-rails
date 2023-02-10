require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  describe 'Post index page process' do
    before(:each) do
      @user = User.create(name: 'Abubakar',
                          photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800',
                          bio: 'This is the user bio')
      @post_first = Post.create(author_id: @user.id, title: 'Post', text: 'This is the post one text')
      @comment_first = Comment.create(post_id: @post_first.id, author_id: @user.id, text: 'This is the comment text')

      visit index_posts_path(user_id: @user.id)
    end
    describe 'index' do
      it 'should show the user profile picture' do
        assert page.has_selector?("img[src='#{@user.photo}']")
      end
    end
    describe 'index' do
      it 'shows the username' do
        assert page.has_content?(@user.name)
      end
    end
    describe 'index' do
      it 'I can see the number of posts a user has written' do
        assert page.has_content?('Number of posts: 1')
      end
    end
    describe 'index' do
      it 'I can see the a posts title' do
        assert page.has_content?(@post_first.title)
      end
    end

    describe 'index' do
      it 'I can see some of the text body' do
        post_body = find('.textPost').text
        # wait for the answer of the test
        expect(post_body).to have_content(@post_first.text)
      end
    end

    describe 'index' do
      it 'I can see the first comments on a post.' do
        expect(page).to have_content('This is the post one text')
      end
    end

    describe 'index' do
      it 'I can see how many comments on a post has.' do
        # wait for the answer of the test
        expect(page).to have_content('Comments: 1')
      end
    end
    describe 'index' do
      it 'I can see how many likes a post has.' do
        # wait for the answer of the test
        expect(page).to have_content('Likes: 0')
      end
    end
    describe 'index' do
      it 'I can see a section for Add Comments if there are more posts than fit on the view.' do
        # check that the user's  pagination is displayed
        expect(page).to have_button('Add Comment')
      end
    end
    describe 'index' do
      it 'When I click on a post, it redirects me to that posts show page' do
        # check that the user's  post  is displayed on the show view
        assert page.has_content?('Post 1')
      end
    end
  end
end
