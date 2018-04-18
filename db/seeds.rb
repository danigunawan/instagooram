# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, Relationship, Media].each do |model|
  model.delete_all
end

users = Array(1..10).map do |n|
  User.create!(
    username: Faker::Internet.user_name,
    full_name: Faker::Name.name,
    profile_picture: "https://placeimg.com/240/240/people",
    bio: Faker::MostInterestingManInTheWorld.quote,
    website: Faker::Internet.url
  )
end

Array(1..20).each do |n|
  Relationship.create!(
    following: users.sample,
    follower: users.sample
  )
end

Array(1..10).each do |n|
  Media.create!(
    user: users.sample,
    media_type: 'image',
    images: {
      low_resolution: {
        url: "https://placeimg.com/50/50/any",
        width: 50,
        height: 50
      },
      thumbnail: {
        url: "https://placeimg.com/100/100/any",
        width: 100,
        height: 100
      },
      standard_resolution: {
        url: "https://placeimg.com/200/200/any",
        width: 200,
        height: 200
      }
    },
    filter: 'Sephia'
  )
end


Array(1..10).each do |n|
  Media.create!(
    user: users.sample,
    media_type: 'video',
    images: {
      low_resolution: {
        url: "https://placeimg.com/50/50/any",
        width: 50,
        height: 50
      },
      thumbnail: {
        url: "https://placeimg.com/100/100/any",
        width: 100,
        height: 100
      },
      standard_resolution: {
        url: "https://placeimg.com/200/200/any",
        width: 200,
        height: 200
      }
    },
    filter: 'Sephia',
    videos: {
      low_resolution: {
        url: "https://youtube.com",
        width: 50,
        height: 50
      },
      standard_resolution: {
        url: "https://youtube.com",
        width: 200,
        height: 200
      }
    }
  )
end