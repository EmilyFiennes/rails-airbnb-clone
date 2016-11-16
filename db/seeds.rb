# Seed for the DB made with love

# Seed for the ski brands
list_of_ski_brands_url = "https://en.wikipedia.org/wiki/List_of_ski_brands"
list_of_ski_brands = []
html_file = RestClient.get(list_of_ski_brands_url)
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.wikitable').each do |element|
  element.css('tr > td[1]').map { |brand| list_of_ski_brands << brand.text }
end
ski_brands = list_of_ski_brands[0..-17]

# Seed for the snowboard brands
list_of_snowboard_brands_url = "http://snowboarding.about.com/od/companiesorganizations/fl/List-of-Major-Snowboard-Brands.htm"
list_of_snowboard_brands = []
html_file = RestClient.get(list_of_snowboard_brands_url)
html_doc = Nokogiri::HTML(html_file)
html_doc.search('p').each do |element|
  element.css('a').map { |brand| list_of_snowboard_brands << brand.text }
end
snowboard_brands = list_of_snowboard_brands[0..-6] # 76 snowboard brands

# Material Category
material_category = ["ski", "snowboard"]

# raw sample data
model_ski = ["freeride", "cross-country", "slalom", "supercross", "mogul", "old-school"]
model_snow = ["all-mountain", "freestyle", "splitboard"]
model_year = 1980..2016
length = 90..250 #cm
segment = ["male", "female", "teenager", "child"]
skill_level =["beginner", "intermediate", "advanced", "expert", "godlike", "yvon"]
price = 1..200 # EUR per day
titles = ["Child's skis", "Snowboard great for all conditions", "Rent my super skis", "Men's carvers", "Woman's carvers"]

# Seed for ski resorts
ski_station_url = "https://en.wikipedia.org/wiki/List_of_ski_areas_and_resorts_in_Europe"
ski_station = []
html_file = RestClient.get(ski_station_url)
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.column-width').each do |element|
  element.css('ul > li').map { |brand| ski_station << brand.text }
end

before_france = ski_station[0..114]
france = ski_station[115..443]
after_france = ski_station[444..999]
france_station = france.map { |station| station.scan(/\S+\:/) }
a =france_station[-27..-1].map { |station| station[0][0..-2] }
b =france_station[-46..-29].map { |station| station[0][0..-2] }
c = france_station[0..77].map { |station| station[0][0..-2] }

list_of_ski_stations = before_france + a + b + c + after_france

# Random pictures
picture_url = "https://www.webe.com.my/website/static/images/no-photo.png"
picture = "https://randomuser.me/api/portraits/men/1.jpg"
user_rating  = (0..5).to_a.sample
random_rating  = (0..5).to_a.sample
pictures = ["https://static.pexels.com/photos/39344/cross-country-skiing-binding-langlaufschuh-cross-country-ski-39344.jpeg", "https://static.pexels.com/photos/30313/pexels-photo-30313.jpg"]

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  password = Faker::Internet.password
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    bio: "No Time for a boring bio, I am Yvon's son.
          #yolo (except if you're a cat)",
    password: password
  )
  user.save
end

print "Creating items"
10.times do
  item = Item.new(
    material_category: "ski",
    brand_name: ski_brands.sample,
    model: model_ski.sample,
    model_year: model_year.to_a.sample,
    length: length.to_a.sample,
    segment: segment.sample,
    skill_level: skill_level.sample,
    price: price.to_a.sample,
    ski_station: list_of_ski_stations.sample,
    user_id: (1..10).to_a.sample,
    title: titles.sample,
    picture_url: pictures.sample
  )
  item.save
  print "🎿  "
end
10.times do
  item = Item.new(
    material_category: "snowboard",
    brand_name: snowboard_brands.sample,
    model: model_snow.sample,
    model_year: model_year.to_a.sample,
    length: length.to_a.sample,
    segment: segment.sample,
    skill_level: skill_level.sample,
    price: price.to_a.sample,
    ski_station: list_of_ski_stations.sample,
    user_id: (1..10).to_a.sample,
    picture_url: pictures.sample
  )
  item.save
end


10.times do
  reservation = Reservation.new(
    start_on: DateTime.now + (1..5).to_a.sample,
    end_on: DateTime.now + (6..15).to_a.sample,
    user_review: "Awesome",
    user_rating: (0..5).to_a.sample,
    owner_review: "Nice",
    owner_rating: (0..5).to_a.sample,
    item_id: (1..20).to_a.sample,
    user_id: (1..10).to_a.sample
  )
  reservation.save
end

(1..20).to_a.each do |i|
availability = Availability.new(
  start_on: DateTime.now + (1..5).to_a.sample,
  end_on: DateTime.now + (6..15).to_a.sample,
  item_id: i
  )
availability.save
end





