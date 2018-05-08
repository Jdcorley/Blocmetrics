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
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::App.name,
    url: Faker::Internet.url 
 )
end

registered_applications = RegisteredApplication.all 

20.times do 
  Event.create!(
    registered_application: registered_applications.sample, 
    name: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
end 

events = Event.all  

 puts "#{User.count} users created."
 puts "#{RegisteredApplication.count} registered_applications added."
 puts "#{Event.count} application events added."