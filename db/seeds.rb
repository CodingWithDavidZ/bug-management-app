# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#By default SQL String limit 255 character
#Ex:- :limit => 40

# Bugs.destroy_all
# Comments.destroy_all
# Teams.destroy_all
# Users.destroy_all
# Projects.destroy_all
# puts 'All records destroyed'

puts '🌰 🌰 🌰 Seeding Database 🌱 🌱 🌱'

puts 'Creating and Seeding Projects'
10.times do
	project =
		Projects.create(
			project_name: Faker::Company.name,
			start_date:
				Faker::Date.between(from: Date.today - 1.year, to: Date.today),
			target_end_date:
				Faker::Date.between(from: Date.today, to: Date.today + 1.year),
			created_by: Faker::Number.between(1, 10),
			bug_id: Faker::Number.between(1, 50),
		)
end
puts 'Seeding of Projects Completed'

puts ' '
puts '.'
puts '..'
puts '...'
puts ' '

puts 'Creating and Seeding Teams'
4.times do
	team =
		Teams.create(
			team_name: Faker::Team.name.creature,
			lead_id: Faker::Number.between(1, 10),
			project_id: Project.all.sample,
			created_by: Faker::Number.between(1, 10),
		)
end
puts 'Seeding of Teams Completed'

puts ' '
puts '.'
puts '..'
puts '...'
puts ' '

puts 'Creating and Seeding Users'
10.times do
	user =
		Users.create(
			firebase_uid: Faker::Number.number(digits: 12),
			username: Faker::Internet.user_name,
			first_name: Faker::Name.first_name,
			last_name: Faker::Name.last_name,
			role: Faker::Number.between(1, 3),
			team_id: Team.all.sample,
			is_team_lead: false,
			avatar: Faker::Avatar.image,
			password: '123456',
			firebase_access_token: Faker::Number.number(digits: 15),
			firebase_phone_number: Faker::Number.number(digits: 10),
			firebase_email: Faker::Internet.safe_email,
			firebase_email_verified: Faker::Boolean.boolean(true_ratio: 0.2),
			firebase_provider_id: Faker::Bank.name,
			firebase_metadata_creationTime:
				Faker::Date.between(from: Date.today - 1.year, to: Date.today),
			firebase_metadata_lastSignInTime: Faker::Date.backward(days: 30),
			firebase_client_version: Faker::Internet.domain_name,
			firebase_photo: 'https://placekitten.com/640/360',
		)
end
puts 'Seeding of Users Completed'

puts ' '
puts '.'
puts '..'
puts '...'
puts ' '

puts 'Creating and Seeding Bugs'
50.times do
	bug =
		Bugs.create(
			issue_summary: Faker::Book.title,
			issue_description: Faker::Hacker.say_something_smart,
			identified_by: User.all.sample,
			related_project_id: Project.all.sample,
			assigned_to: User.all.sample,
			status: Faker::Number.between(1, 13),
			priority: Faker::Number.between(1, 5),
			target_resolution_date:
				Faker::Date.between(from: Date.today, to: Date.today + 1.year),
			progress: Faker::Number.between(1, 10),
			approved: false,
			image_url: Faker::Fillmurray.image,
		)
end
puts 'Seeding of Bugs Completed'

puts ' '
puts '.'
puts '..'
puts '...'
puts ' '

puts 'Creating and Seeding Comments'
120.times do
	comment =
		Comments.create(
			comment: Faker::Lorem.sentence,
			created_by: User.all.sample,
			bug_id: Bug.all.sample,
		)
end
puts 'Seeding of Comments Completed'
