require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  before(:each) do
    # Create users
    @user_1 = User.create(name: 'Anthony', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 1)
    @user_2 = User.create(name: 'Sunday', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 2)
    @user_3 = User.create(name: 'Ezema', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio:
    'Lorem ipsum dolor sit amet sss labore fugiat!.', posts_counter: 3)
    @post_1 = Post.create(author_id: @user_1.id, title: 'The jungle', text: 'Lorem ipsum fugiat!', likes_counter: 1,
                          comments_counter: 1)
    @post_2 = Post.create(author_id: @user_1.id, title: 'The animals', text: 'Lorem ipsum fugiat!',
                          likes_counter: 1, comments_counter: 1)
    @post_3 = Post.create(author_id: @user_3.id, title: 'The food', text: 'Lorem ipsum fugiat!', likes_counter: 2,
                          comments_counter: 0)
    @comment_1 = Comment.create(post_id: @post_1.id, author_id: @user_1.id, text: 'Hi Tom!')
    @comment_2 = Comment.create(post_id: @post_2.id, author_id: @user_1.id, text: 'Hi great content!')
    @comment_3 = Comment.create(post_id: @post_3.id, author_id: @user_2.id, text: 'Nice!')
  end
  describe 'show' do
    it 'I can see the posts title' do
      visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
      assert page.has_content?(@post_1.title)
    end
  end

  describe 'show' do
    it 'I can see the posts text' do
      visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
      assert page.has_content?(@post_1.text)
    end
  end

  it 'I can see who wrote the post' do
    visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
    assert page.has_content?("Post #{@post_1.id} by #{@user_1.name}")
  end
  describe 'show' do
    it 'I can see how many comments it has' do
      visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
      comment_count = all('.commentMessage').count
      expect(comment_count).to eq(2)
    end
  end
  describe 'show' do
    it 'I can see how many Likes it has' do
      visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
      likes = find('.comLikesPost')
      expect(likes).to have_content('Likes: 1')
    end
  end
  describe 'show' do
    it 'I can see the post body' do
      visit show_posts_path(user_id: @user_1.id, post_id: @post_1.id)
      post_body = find('.textPost').text
      expect(post_body).to have_content(@post_1.text)
    end
  end
  describe 'show' do
    it 'I can see the comment of each commentor left' do
      visit show_posts_path(user_id: @user_2.id, post_id: @post_3.id)
      user_2 = find('.commentMessage')
      expect(user_2).to have_content('Nice!')
    end
  end
end
