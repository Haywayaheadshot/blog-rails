require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Matt', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Banker from Italy.')
  post = Post.create(author_id: user.id, title: 'Hello', text: 'Hello World')
  subject { Comment.create(posts_id: post.id, author_id: user.id, text: 'Hi Jerry!') }
  before { subject.save }

  it 'posts_id should be present' do
    subject.posts_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
