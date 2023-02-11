require 'rails_helper'

RSpec.describe 'UserController', type: :system do
  before(:each) do
    # Create users
    @user = User.create(name: 'Anthony', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800',
                        bio: 'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 0)
    @first_post = Post.create(author_id: @user.id, title: 'The jungle', text: 'Lorem ipsum fugiat!', likes_counter: 1,
                              comments_counter: 1)
    @second_post = Post.create(author_id: @user.id, title: 'Rails is full of errors', text: 'Lorem ipsum fugiat!', likes_counter: 2,
                               comments_counter: 0)
    @third_post = Post.create(author_id: @user.id, title: 'Hmmmmmm!', text: 'Lorem ipsum fugiat!', likes_counter: 3,
                              comments_counter: 0)
  end

  describe 'show' do
    it 'I can see the profile picture for the user selected' do
      # navigate to the index page with the especific index.
      visit user_path(id: @user.id)
      # assert that the profile picture is present.

      assert page.has_selector?("img[src='#{@user.photo}']")
    end
  end

  describe 'show' do
    it 'shows the username' do
      # Visit the index user path
      visit user_path(id: @user.id)
      # wait for the answer of the test
      assert page.has_content?(@user.name)
    end
  end

  describe 'show' do
    it 'I can see the number of posts a user has written' do
      # navigate to the index page
      visit root_path
      # assert that the number of post is present for each user.

      assert page.has_content?('Number of posts: 3')
    end
  end

  describe 'show' do
    it 'I can see the users bio' do
      # Visit the index user path
      visit user_path(id: @user.id)
      # wait for the answer of the test
      assert page.has_content?(@user.bio)
    end
  end

  describe 'show' do
    it 'I can see the users first 3 posts' do
      # Visit the index user path
      visit user_path(id: @user.id)
      # wait for the answer of the test
      assert page.has_content?('Post 1')
      assert page.has_content?('Post 2')
      assert page.has_content?('Post 3')
    end
  end

  describe 'show' do
    it 'I can see the button that lets me view all of a user\'s posts' do
      # Visit the index user path
      visit user_path(id: @user.id)
      # wait for the answer of the test
      expect(page).to have_button('See All Posts')
    end
  end

  describe 'show' do
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      visit user_path(id: @user.id)
      # check that the user's  post  is displayed on the show view
      assert page.has_content?('Post 1')
      assert page.has_content?('Post 2')
      assert page.has_content?('Post 3')
      expect(page).to have_button('Pagination')
    end
  end

  describe 'show' do
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      visit user_path(id: @user.id)
      # check that the user's  post  is displayed on the show view
      assert page.has_content?('Post 1')
      assert page.has_content?('Post 2')
      assert page.has_content?('Post 3')
      expect(page).to have_button('Add Post')
    end
  end
end
