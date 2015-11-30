
<<<<<<< 848c5c1d950edf623fd54d1ac88e19164514d8cb
# 10.times do
#
#   DrillGroup.create!({name: Faker::Hacker.noun})
# end
#
# 10.times do
# 	Drill.create({name: Faker::Company.bs,
#                 description:  Faker::Lorem.paragraph,
#                 points: 10 })
#
# #
#   DrillGroup.create!({name: Faker::Hacker.noun})
#
#   user = User.find(1)
#   dg = DrillGroup.create({name: Faker::Hacker.noun,
#                           description: Faker::Hacker.say_something_smart,
#                           user_id: user.id
#                           })
#   answer = Answer.create({description: Faker::Hacker.say_something_smart})
#   drill = Drill.create({name: Faker::Company.bs,
#                         description:  Faker::Lorem.paragraph, answer_id: answer.id,
#                         drill_group_id: dg.id })
#
# end
#
# 10.times do
#   User.create({ first_name:   Faker::Name.first_name,
#                 last_name:    Faker::Name.last_name,
#                 email:        Faker::Internet.email,
#                 password:      Faker::Internet.password
#                   })
# end
#
# 10.times do
#
#   user  = User.create(
#                 {first_name: Faker::Name.first_name,
#                 last_name:  Faker::Name.last_name,
#                 email:      Faker::Internet.email,
#                 password:   Faker::Internet.password })
# end
=======
10.times do

  DrillGroup.create!({name: Faker::Hacker.noun})
end

10.times do
	Drill.create!({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph })

  DrillGroup.create!({name: Faker::Hacker.noun})
  user = User.find(1) 
  dg 	= DrillGroup.create!({name: Faker::Hacker.noun,
                          description: Faker::Hacker.say_something_smart,
                          user_id: user.id
                          })


  answer = Answer.create!({description: Faker::Hacker.say_something_smart})
  drill = Drill.create!({name: Faker::Company.bs,
                        description:  Faker::Lorem.paragraph, answer_id: answer.id,
                        drill_group_id: dg.id })

end


10.times do
  User.create(
  							{ first_name:   Faker::Name.first_name,
                last_name:    Faker::Name.last_name,
                email:        Faker::Internet.email,
                password:      Fake::Internet.password })
end

10.times do

  user  = User.create(
                {first_name: Fake::Name.first_name,
                last_name:  Faker::Name.last_name,
                email:      Faker::Internet.email,
                password:   Faker::Internet.password })
end
>>>>>>> seed completed?

['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

badges = ["Ruby Lover", "Rails Routes", "Javascript Master", "Rails Newbie"]
#badges.sort! {|a, b| a <=> b}

badges.each do |badge|
  Badge.create(name: badge)
end

# 10.times do
# 	answer = Answer.create!({description: Faker::Hacker.say_something_smart})
# 	Drill.create!({name: Faker::Company.bs,
#                	 description:  Faker::Lorem.paragraph, answer_id: answer.id })
# end
#
#
#
# admin = User.create!(
# 	:first_name => "master",
# 	:last_name	=> "bot",
# 	:email 			=> "user1222345@admin.com",
# 	:password 	=> "password",
# 	:password_confirmation => "password")
#
# non_admin = User.create(
# 	:first_name => "person",
#   :last_name 	=> "human",
#   :email 			=> "user6@admin.com",
#   :password 	=> "password",
#   :password_confirmation => "password")
#
# non_admin.drills.push(Drill.new(name: "Personless", description: "Super fun, you should try it"))
# non_admin.save
#
# non_admin = User.create!(
#   :first_name => "person",
#   :last_name 	=> "human",
#   :email 			=> "user624534543@admin.com",
#   :password 	=> "password",
#   :password_confirmation => "password")

10.times do
  Category.create(name: Faker::Hacker.noun)
end
<<<<<<< 848c5c1d950edf623fd54d1ac88e19164514d8cb
=======




admin = User.create( 
	:first_name => "master", 
	:last_name	=> "bot",  
	:email 			=> "user1222345@admin.com", 
	:password 	=> "password",
	:admin      => true 
	:password_confirmation => "password")

	

non_admin = User.create( :first_name => "person",
:last_name 	=> "human",
:email 			=> "user6@admin.com",
:password 	=> "password",
:password_confirmation => "password")

#non_admin.drills.push(Drill.new(name: "Personless", description: "Super fun, you should try it"))
non_admin.save

non_admin = User.create!(
  :first_name => "person",
  :last_name 	=> "human",
  :email 			=> "user624534543@admin.com",
  :password 	=> "password",
  :password_confirmation => "password")
>>>>>>> seed completed?
