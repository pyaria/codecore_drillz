10.times do
  Drill.create({name: Faker::Company.bs,
                description:  Faker::Lorem.paragraph })
end

10.times do
  DrillGroup.create({name: Faker::Hacker.noun})
end
