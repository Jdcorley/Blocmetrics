require 'faker'

5.times do 
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'helloworld',
    confirmed_at: Time.now 
  ) 
end
User.create!(
  email: 'bob@dabuilder.com',
  password: 'helloworld',
  confirmed_at: Time.now
)
User.create!(
  email: 'jack@test.com',
  password: 'helloworld',
  confirmed_at: Time.now
)

users = User.all 

10.times do 
  Application.create!(
    user: users.sample,
    name: Faker::App.name,
    url: Faker::Internet.url 
 )
end 

 applications = Application.all 

 puts "#{User.count} users created."
 puts "#{Application.count} applications added."

