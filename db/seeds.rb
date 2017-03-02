@user = User.create(email: "test@test.com", password: "abcdef", password_confirmation: "abcdef", first_name: "William", last_name: "Yeats")
puts "1 User created"

10.times do |banner|
  Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: "k:/banners/sleeping", location: "Jumbotron 2", user_id: @user.id)
end

puts "10 Banner requests have been created"