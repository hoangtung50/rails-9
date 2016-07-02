# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "==== Create Users ===="
User.destroy_all

user1 = User.create!({ email: 'user@example.com', password: '123123123' })
user2 = User.create!({ email: 'user1@example.com', password: '123123123' })
puts "==== End ===="


puts "==== Create Comments ===="
Comment.destroy_all

Comment.create!({ content: 'comment 1', user: user1 })
Comment.create!({ content: 'comment 2', user: user2 })
Comment.create!({ content: 'comment 3', user: user2 })
puts "==== End ===="



