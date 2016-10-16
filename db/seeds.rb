# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all

@user1 = User.create(username: "Hyphoid", email: "hyphoid@riseup.net", password: "123456", password_confirmation: "123456")
@user2 = User.create(username: "Capture the Flag London", email: "ctf_london@riseup.net", password: "123456", password_confirmation: "123456")
@user3 = User.create(username: "Capture the Flag Paris", email: "ctf_paris@riseup.net", password: "123456", password_confirmation: "123456")
@user4 = User.create(username: "Reclaim The Streets", email: "rts@riseup.net", password: "123456", password_confirmation: "123456")
@user5 = User.create(username: "Space Hijackers", email: "spacehijackers@riseup.net", password: "123456", password_confirmation: "123456")
@user6 = User.create(username: "Brown Clown", email: "brownclown@riseup.net", password: "123456", password_confirmation: "123456")
@user7 = User.create(username: "Rebel Clown Army", email: "rebelclownarmy@riseup.net", password: "123456", password_confirmation: "123456")
@user8 = User.create(username: "Umbrella", email: "umbrella@riseup.net", password: "123456", password_confirmation: "123456")
