
10.times do
  DrillGroup.create!({name: Faker::Hacker.noun})
end

10.times do
	Drill.create({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph })

  DrillGroup.create!({name: Faker::Hacker.noun})
end

10.times do
	answer = Answer.create!({description: Faker::Hacker.say_something_smart})
	Drill.create!({name: Faker::Company.bs,
               	 description:  Faker::Lorem.paragraph, answer_id: answer.id })
end

	

admin = User.create!( 
	:first_name => "master", 
	:last_name	=> "bot",  
	:email 			=> "user1222345@admin.com", 
	:password 	=> "password", 
	:password_confirmation => "password")

non_admin = User.create( 
	:first_name => "person",
  :last_name 	=> "human",
  :email 			=> "user6@admin.com",
  :password 	=> "password",
  :password_confirmation => "password")

non_admin.drills.push(Drill.new(name: "Personless", description: "Super fun, you should try it"))
non_admin.save

non_admin = User.create!(
  :first_name => "person",
  :last_name 	=> "human",
  :email 			=> "user624534543@admin.com",
  :password 	=> "password",
  :password_confirmation => "password")
