
10.times do
  DrillGroup.create!({name: Faker::Hacker.noun})
end

10.times do
  Drill.create!({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph })
end
	

 admin = User.create!(
    :first_name => "master",
    :last_name 	=> "admin",
    :email 		=> "user1@admin.com",
    :password 	=> "password",
    :password_confirmation => "password"
)
non_admin = User( :first_name => "person",
    :last_name 	=> "non_admin",
    :email 		=> "user6@admin.com",
    :password 	=> "password",
    :password_confirmation => "password")
non_admin.drills.push(Drill.new())
non_admin.save

non_admin = User.create!(
    :first_name => "person",
    :last_name 	=> "non_admin",
    :email 		=> "user6@admin.com",
    :password 	=> "password",
    :password_confirmation => "password"
)
