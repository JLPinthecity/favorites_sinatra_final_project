#create 20 users

20.times do 
  username = Faker::Internet.username
  email = Faker::Internet.email
  password = Faker::Internet.password 
  User.create(:name => username, :email => email, :password => password)
end

#create 40 favorites

40.times do 
  category = "favorite movie"
  name = Faker::Movie.title
  notes = Faker::Movie.quote
  Favorite.create(:category => category, :name => name, :notes => notes)
end

#create 20 urls

20.times do 
  link = Faker::Internet.url 
  Url.create(:link => link)
end




