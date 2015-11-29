
10.times do
  DrillGroup.create({name: Faker::Hacker.noun})
end

10.times do
  answer = Answer.create({description: Faker::Hacker.say_something_smart})
  drill = Drill.create({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph, answer_id: answer.id })
end

10.times do

  user  = User.create(
                {first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                email:      Faker::Internet.email,
                password:   Faker::Internet.password })
end
