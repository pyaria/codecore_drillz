admin  = User.create( 
	:first_name => "Johnathan", 
	:last_name	=> "Macintosh",  
	:email 			=> "user122f2345@admin.com", 
	:password 	=> "password",
	:admin      => true,
	:password_confirmation => "password")

non_admin = User.create( 
	:first_name => "Jim",
	:last_name 	=> "Walker",
	:email 			=> "user6@admin.com",
	:password 	=> "password",
	:password_confirmation => "password")
	
#non_admin.drills.push(Drill.new(name: "Personless", description: "Super fun, you should try it"))
non_admin.save

non_admin = User.create!(
  :first_name => "Jenny",
  :last_name 	=> "Johnson",
  :email 			=> "user624534543@admin.com",
  :password 	=> "password",
  :password_confirmation => "password")
 
		
10.times do
 DrillGroup.create!({name: Faker::Hacker.noun,
  									 user_id: admin})
end

DrillGroup.all.each do |dg|
10.times do
	Drill.create!({name: 				 Faker::Company.bs,
                 description:  Faker::Lorem.paragraph, 
                 points: 1,
                 user_id: admin,
                 drill_group_id: dg
                 })
 end
end
	

  #answer = Answer.create!({ description: Faker::Hacker.say_something_smart})

badges = ["Ruby Lover", "Rails Routes", "Javascript Master", "Rails Newbie"]
#badges.sort! {|a, b| a <=> b}

badges.each do |badge|
  Badge.create(name: badge)
end


10.times do
  Category.create(name: Faker::Hacker.noun)
end


