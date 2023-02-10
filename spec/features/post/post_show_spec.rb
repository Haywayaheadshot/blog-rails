require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  before(:each) do
    # Create users
    @user_first = User.create(name: 'Anthony', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 1)
    @user_second = User.create(name: 'Sunday', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 2)
    @user_third = User.create(name: 'Ezema', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 3)
    @post_one = Post.create(author_id: @user_first.id, title: 'The jungle', text: 'Lorem ipsum fugiat!', likes_counter: 1,
                            comments_counter: 1)
    @post_two = Post.create(author_id: @user_first.id, title: 'The animals', text: 'Lorem ipsum fugiat!',
                            likes_counter: 1, comments_counter: 1)
    @post_three = Post.create(author_id: @user_third.id, title: 'The food', text: 'Lorem ipsum fugiat!', likes_counter: 2,
                              comments_counter: 0)
    @comment_first = Comment.create(post_id: @post_one.id, author_id: @user_first.id, text: 'Hi Tom!')
    @comment_two = Comment.create(post_id: @post_two.id, author_id: @user_first.id, text: 'Hi great content!')
    @comment_three = Comment.create(post_id: @post_three.id, author_id: @user_second.id, text: 'Nice!')
  end
  describe 'show' do
    it 'I can see the posts title' do
      visit show_posts_path(user_id: @user_first.id, post_id: @post_one.id)
      assert page.has_content?(@post_one.title)
    end
  end

  describe 'show' do
    it 'I can see the posts text' do
      visit show_posts_path(user_id: @user_first.id, post_id: @post_one.id)
      assert page.has_content?(@post_one.text)
    end
  end

  it 'I can see who wrote the post' do
    visit show_posts_path(user_id: @user_first.id, post_id: @post_one.id)
    assert page.has_content?("Post #{@post_one.id} by #{@user_first.name}")
  end

  describe 'show' do
    it 'I can see how many comments it has' do
      visit show_posts_path(user_id: @user_first.id, post_id: @post_two.id)
      expect(page).to have_content('Lorem ipsum fugiat!')
    end
  end
  describe 'show' do
    it 'I can see how many Likes it has' do
      visit show_posts_path(user_id: @user_first.id, post_id: @post_one.id)
      likes = find('.comLikesPost')
      expect(likes).to have_content('Likes: 1')
    end
  end

  describe 'show' do
    it 'I can see the post body' do
      visit show_posts_path(user_id: @user_first.id, post_id: @post_one.id)
      post_body = find('.textPost').text
      expect(post_body).to have_content(@post_one.text)
    end
  end

  describe 'show' do
    it 'I can see the comment of each commentor left' do
      visit show_posts_path(user_id: @user_second.id, post_id: @post_three.id)
      expect(page).to have_content('The food')
    end
  end
end
