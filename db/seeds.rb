
10.times do
  DrillGroup.create({name: Faker::Hacker.noun})
end

10.times do
  answer = Answer.create({description: Faker::Hacker.say_something_smart})
  drill = Drill.create({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph, answer_id: answer.id })
end
