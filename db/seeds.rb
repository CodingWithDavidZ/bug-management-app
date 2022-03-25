# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#By default SQL String limit 255 character
#Ex:- :limit => 40
puts ' '
puts 'Destroying all pevious Seeds'
puts ' '
sleep(1)
Bug.destroy_all
Comment.destroy_all
Team.destroy_all
User.destroy_all
Project.destroy_all
puts 'All records destroyed'

puts ' '
puts '🌰 🌰 🌰 Seeding Database 🌱 🌱 🌱'
sleep(1)
puts ' '

puts 'Creating and Seeding Projects'
10.times do
	project =
		Project.create!(
			project_name: Faker::Company.name,
			start_date:
				Faker::Date.between(from: Date.today - 1.year, to: Date.today),
			target_end_date:
				Faker::Date.between(from: Date.today, to: Date.today + 1.year),
			created_by: rand(1...11),
			bug_id: rand(1...51),
		)
end
puts 'Seeding of Projects Completed'

puts ' '
sleep(0.25)
puts '.'
sleep(0.25)
puts '..'
sleep(0.25)
puts '...'
sleep(0.25)
puts ' '

puts 'Creating and Seeding Teams'
sleep(1)
4.times do
	team =
		Team.create!(
			team_name: Faker::Team.creature,
			lead_id: rand(1...11),
			project_id: rand(1...11),
			created_by: rand(1...11),
		)
end
puts 'Seeding of Teams Completed'

puts ' '
sleep(0.25)
puts '.'
sleep(0.25)
puts '..'
sleep(0.25)
puts '...'
sleep(0.25)
puts ' '

puts 'Creating and Seeding Users'
sleep(1)
10.times do
	user =
		User.create!(
			firebase_uid: Faker::Number.number(digits: 12),
			username: Faker::Internet.user_name,
			first_name: Faker::Name.first_name,
			last_name: Faker::Name.last_name,
			role: rand(1...4),
			team_id: rand(1...5),
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
sleep(0.25)
puts '.'
sleep(0.25)
puts '..'
sleep(0.25)
puts '...'
sleep(0.25)
puts ' '

puts 'Creating and Seeding Bugs'
sleep(1)
50.times do
	bug =
		Bug.create!(
			issue_title: Faker::Book.title,
			issue_description: Faker::Hacker.say_something_smart,
			identified_by: rand(1...11),
			project_id: rand(1...5),
			assigned_to: rand(1...11),
			status: rand(1...14),
			priority: rand(1...6),
			target_resolution_date:
				Faker::Date.between(from: Date.today, to: Date.today + 1.year),
			progress: rand(1...11),
			approved: false,
			image_url: Faker::Fillmurray.image,
		)
end
puts 'Seeding of Bugs Completed'

puts ' '
sleep(0.25)
puts '.'
sleep(0.25)
puts '..'
sleep(0.25)
puts '...'
sleep(0.25)
puts ' '

puts 'Creating and Seeding Comments'
sleep(1)
120.times do
	comment =
		Comment.create!(
			comment_text: Faker::Lorem.sentence,
			created_by: rand(1...11),
			bug_id: rand(1...51),
		)
end
puts 'Seeding of Comments Completed'
