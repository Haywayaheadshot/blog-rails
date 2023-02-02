# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'user1', photo: 'photo', bio: 'bio1')
User.create(name: 'Mary', photo: 'photo1', bio: 'I am a straight woman')
User.create(name: 'Jack', photo: 'photo1', bio: 'I am a trangender man')
User.create(name: 'Maline', photo: 'photo2', bio: 'I am queer person')
Post.create(title: 'Hello', text: 'Greetings from Peru', author_id: 1)
Post.create(title: 'Hello', text: 'Greetings from Togo', author_id: 2)
Post.create(title: 'Hello', text: 'Greetings from Ghana', author_id: 3)
Post.create(title: 'Hello', text: 'Greetings from Mali', author_id: 4)
Comment.create( author_id: 1, post_id: 1, text: 'First Comment')
Comment.create( author_id: 2, post_id: 1, text: 'So am I')
Comment.create( author_id: 3, post_id: 1, text: 'You are so handsome')
Comment.create( author_id: 4, post_id: 1, text: 'I respect you')
# rails db:seed
