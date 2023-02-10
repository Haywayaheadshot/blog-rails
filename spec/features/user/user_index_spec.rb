require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before(:each) do
    # Create users
    @user_one = User.create(name: 'Method', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 1)
    @user_two = User.create(name: 'Man', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 2)
  end
  describe 'index' do
    it 'shows the username of all users' do
      # Visit the index user path
      visit root_path
      assert page.has_content?(@user_one.name)
    end
  end
  describe 'index' do
    it 'shows the username of all users' do
      # Visit the index user path
      visit root_path
      assert page.has_content?(@user_two.name)
      assert page.has_content?(@user_one.name)
    end
  end

  describe 'index' do
    it 'I can see the profile picture for each user' do
      visit root_path
      # assert that the profile picture is present for each use
      assert page.has_selector?("img[src='#{@user_one.photo}']")
    end
  end
  describe 'index' do
    it 'I can see the profile picture for each user' do
      visit root_path
      # assert that the profile picture is present for each use
      assert page.has_selector?("img[src='#{@user_two.photo}']")
    end
  end
  describe 'index' do
    it 'I can see the number of posts each user has written' do
      # navigate to the index page
      visit root_path
      # assert that the number of post is present for each user.
      assert page.has_content?("Number of posts: #{@user_one.posts_counter}")
    end
  end
  describe 'index' do
    it 'I can see the number of posts each user has written' do
      # navigate to the index page
      visit root_path
      # assert that the number of post is present for each user.
      assert page.has_content?("Number of posts: #{@user_two.posts_counter}")
    end
  end
  describe 'index' do
    it 'When I click on a user, I am redirected to that users show page' do
      visit user_path(id: @user_one.id)
      # check that the user's name is displayed on the show view
      expect(page).to have_content @user_one.name
    end
  end
  describe 'index' do
    it 'When I click on a user, I am redirected to that users show page' do
      visit user_path(id: @user_two.id)
      # check that the user's name is displayed on the show view
      expect(page).to have_content @user_two.name
    end
  end
end
