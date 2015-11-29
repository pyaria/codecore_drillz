
10.times do
  user = User.find(1)
  dg = DrillGroup.create({name: Faker::Hacker.noun,
                          description: Faker::Hacker.say_something_smart,
                          user_id: user.id
                          })
  answer = Answer.create({description: Faker::Hacker.say_something_smart})
  drill = Drill.create({name: Faker::Company.bs,
                        description:  Faker::Lorem.paragraph, answer_id: answer.id,
                        drill_group_id: dg.id })

end

10.times do
  User.create({ first_name:   Faker::Name.first_name,
                last_name:    Faker::Name.last_name,
                email:        Faker::Internet.email,
                password:      Faker::Internet.password
                  })
end
