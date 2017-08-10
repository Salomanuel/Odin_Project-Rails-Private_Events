User.create!(name: "Manuel")

30.times do 
	name = Faker::Pokemon.name
	User.create!(name: name)
end

Event.create!(name: "Drunk Jenga",
							date: Time.now,
							creator_id: 1)

10.times do
	name  = "Party in #{Faker::Pokemon.location}"
	date  = Faker::Date.between(1.year.ago, 1.year.from_now)
	owner = rand(User.all.count) + 1
	Event.create!(name: name,
								date: date,
								creator_id: owner)
end