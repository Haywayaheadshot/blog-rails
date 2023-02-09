# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@paul = User.create(name: 'Paul', photo: 'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=800', bio: 'bio1')
@mary = User.create(name: 'Mary', photo: 'https://images.pexels.com/photos/1254140/pexels-photo-1254140.jpeg?auto=compress&cs=tinysrgb&w=800', bio: 'I am a straight woman')
@Jack = User.create(name: 'Jack', photo: 'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&w=800', bio: 'I am a trangender man')
@maline = User.create(name: 'Maline', photo: 'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&w=800', bio: 'I am queer person')
@post_1 = Post.create(title: 'Hello', text: 'Greetings from Peru', author_id: @paul.id)
@post_2 = Post.create(title: 'Hello', text: 'Greetings from Togo', author_id: @paul.id)
@post_3 = Post.create(title: 'Hello', text: 'Greetings from Ghana', author_id: @mary.id)
@post_4 = Post.create(title: 'Hello', text: 'Greetings from Mali', author_id: @maline.id)
Comment.create( author_id: @paul.id, post_id: @post_1.id, text: 'First Comment')
Comment.create( author_id: @paul.id, post_id: @post_2.id, text: 'So am I')
Comment.create( author_id: @mary.id, post_id: @post_3.id, text: 'You are so handsome')
Comment.create( author_id: @maline.id, post_id: @post_4.id, text: 'I respect you')
# rails db:seed
