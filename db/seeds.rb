10.times do |banner|
  Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: "k:/banners/sleeping", location: "Jumbotron 2")
end

puts "10 Banner requests have been created"