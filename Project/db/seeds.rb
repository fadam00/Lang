
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS

frank = User.create!(name: "Frank V. Adames", email: "frank@mail.com", password: "foobar", password_confirmation: "foobar", admin: true , role: "client"
	)
peter = User.create!(name: "Peter Griffin", email: "peter@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "translator")
ross = User.create!(name: "Ross Smith", email: "ross@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
lisa = User.create!(name: "Lisa Peters", email: "lisa@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "translator")
susan = User.create!(name: "Susan Sarandon", email: "susan@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
maria = User.create!(name: "Maria Calderon", email: "maria@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
juan = User.create!(name: "Juan Perez", email: "juan@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "translator")
roman = User.create!(name: "Roman Pulisck", email: "roman@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
ignacio = User.create!(name: "Ignacio Robles", email: "ignacio@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
rosa = User.create!(name: "Rosa Diaz", email: "rosa@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)
pedro = User.create!(name: "Pedro Mendez", email: "pedro@mail.com", password: "foobar", password_confirmation: "foobar", admin: false, role: "client"
	)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@mail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

#REQUESTS

users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.requests.create!(content: content) }
end

# #Relationships

# users = User.all
# user  = users.first
# watching = users[2..50]
# watchers = users[3..40]
# watching.each { |watched| user.watch(watched) }
# watchers.each { |watcher| watcher.watch(user) }