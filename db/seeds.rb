# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all

@user1 = User.create(username: "kyphae", email: "kyphae@hyphoid.net", password: "123456", password_confirmation: "123456")
@user2 = User.create(username: "bob", email: "bob@hyphoid.net", password: "123456", password_confirmation: "123456")
@user3 = User.create(username: "dan", email: "dan@hyphoid.net", password: "123456", password_confirmation: "123456")
@user4 = User.create(username: "elly", email: "elly@hyphoid.net", password: "123456", password_confirmation: "123456")
@user5 = User.create(username: "pezza", email: "pezza@hyphoid.net", password: "123456", password_confirmation: "123456")
@user6 = User.create(username: "brownclown", email: "brownclown@hyphoid.net", password: "123456", password_confirmation: "123456")
@user7 = User.create(username: "quaid", email: "quaid@hyphoid.net", password: "123456", password_confirmation: "123456")
@user8 = User.create(username: "flargh", email: "flargh@hyphoid.net", password: "123456", password_confirmation: "123456")

