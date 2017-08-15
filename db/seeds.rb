# MANUEL User, Manuel Party
m = User.create!(name: "Manuel")

e = Event.create!(name: "Drunk Jenga",
							date: Time.now,
							creator_id: 1)
Invitation.create!( attendee_id: m.id, attended_event_id: e.id)

# USERS
30.times do 
	name = Faker::Pokemon.name
	User.create!(name: name)
end

# EVENTS
10.times do
	name  = "Party in #{Faker::Pokemon.location}"
	date  = Faker::Date.between(1.year.ago, 1.year.from_now)
	owner = rand(User.all.count) + 1
	event = Event.create!(name: name,
								date: date,
								creator_id: owner)
	Invitation.create!(
		attendee_id: 				owner, 
		attended_event_id: 	event.id )
end

# INVITATIONS
30.times do
	Invitation.create!(
		attendee_id: 				rand(User.count) +1, 
		attended_event_id: 	rand(Event.count)+1 )
end