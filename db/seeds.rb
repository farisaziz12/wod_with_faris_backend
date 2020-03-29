# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# user seeds

user1 = User.create(first_name: "Faris", last_name: "Aziz", email: "farisaziz12@gmail.com", tokens: 1, coach: true)
user2 = User.create(first_name: "Test", last_name: "User1", email: "testuser1@gmail.com", tokens: 5, coach: false)
user3 = User.create(first_name: "Test", last_name: "User2", email: "testuser2@gmail.com", tokens: 5, coach: false)
user4 = User.create(first_name: "Test", last_name: "User3", email: "testuser3@gmail.com", tokens: 5, coach: false)
user5 = User.create(first_name: "Test", last_name: "User4", email: "testuser4@gmail.com", tokens: 5, coach: false)

# session seeds

session1 = Session.create(name: "Metcon", description: "Full body workout", date: '29.03.2020', time: '12:00', user_id: user1.id)
session2 = Session.create(name: "Gymnastics", description: "Handstand Work", date: '29.03.2020', time: '15:00', user_id: user1.id)
session3 = Session.create(name: "Core360", description: "6 Pack Abs", date: '30.03.2020', time: '12:00', user_id: user1.id)
session4 = Session.create(name: "Core360", description: "8 Pack Abs", date: '06.04.2020', time: '12:00', user_id: user1.id)

# user sessions seeds

UserSession.create(user: user1, session: session4)
UserSession.create(user: user2, session: session1)
UserSession.create(user: user3, session: session1)
UserSession.create(user: user4, session: session1)
UserSession.create(user: user5, session: session1)
UserSession.create(user: user3, session: session2)

puts "seeds done"

