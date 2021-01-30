# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "kam1tsur3",
  email: "kam1tsur3@kam.kam",
  password: "password",
  password_confirmation: "password",
  admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+2}@example.com"
  password = "password"
  team_id = n+2
  User.create!(name: name, email: email, password: password, password_confirmation: password, team_id: team_id)
end

Team.create!(name: "KUDoS",
  password: "password",
  password_confirmation: "password",
  leader_id: 1)

99.times do |n|
  name = "Team#{n+2}"
  password =  "password"
  leader_id = n+2
  Team.create!(name: name, password: password, password_confirmation: password, leader_id: leader_id)
end

Challenge.create!(
  name: "Welcome",
  description: "flag{welcome_to_ghost_town_ctf}",
  flag: "flag{welcome_to_ghost_town_ctf}",
  point: 500,
  category: "warmup",
  file_path: nil,
  active: true
)

Challenge.create!(
  name: "Follow the rule",
  description: "Have you checked the rule already?",
  flag: "flag{you_should_check_rule_before_playing!}",
  point: 500,
  category: "misc",
  file_path: nil,
  active: true
)


