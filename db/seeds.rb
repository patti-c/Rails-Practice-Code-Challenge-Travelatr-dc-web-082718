30.times do
  Destination.create({
    name: Faker::GameOfThrones.city,
    country: Faker::Address.country
  })
end


10.times do
  blogger = Blogger.create({
    name: Faker::Name.name,
    bio: Faker::Hipster.paragraph,
    age: (13..100).to_a.sample
  })

  (2..6).to_a.sample.times do
    Post.create({
      title: Faker::Hipster.sentence(3),
      content: Faker::Hipster.paragraphs(4),
      likes: (0..100).to_a.sample,
      blogger: blogger,
      destination: Destination.all.sample
    })
  end
end
