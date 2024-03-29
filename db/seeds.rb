ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."

    User.create!(
      name: 'Demo User', 
      email: 'demo@demo.com', 
      password: 'password'
    )
    
    # More users
    20.times do 
      User.create!({
        name: Faker::Internet.unique.username(specifier: 3),
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end
  
  puts "User Done!"
    
end


# wine data generator

Wine.destroy_all

red_grapes = ['Pinot Noir', 'Cabernet Sauvignon', 'Merlot', 'Malbec', 'Syrah', 'Zinfandel', 'Grenache']
white_grapes = ['Sauvignon Blanc', 'Chardonnay', 'Riesling']
regions = ['Piedmont', 'Rhone Valley', 'Barossa Valley', 'Mendoza', 'Marlborough', 'Mosel', 'Rioja']
countries = ['Spain', 'Argentina', 'Chile', 'Australia', 'New Zealand', 'Germany', 'Portugal']
red_imgs = [
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_1.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_10.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_11.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_12.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_13.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_14.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_15.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_16.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_17.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_18.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_19.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_2.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_20.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_21.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_22.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_23.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_24.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_25.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_26.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_27.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_28.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_29.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_3.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_30.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_31.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_4.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_5.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_6.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_7.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_8.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/red_9.png'
]

white_imgs = [
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_1.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_10.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_11.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_12.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_13.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_14.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_15.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_16.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_17.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_18.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_19.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_2.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_20.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_21.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_22.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_23.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_24.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_25.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_26.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_27.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_28.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_29.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_30.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_4.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_5.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_6.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_7.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_8.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_9.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/white_3.png'
]

rose_imgs = [
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_1.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_10.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_11.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_12.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_13.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_14.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_15.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_16.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_17.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_18.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_19.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_2.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_20.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_21.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_22.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_23.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_24.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_25.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_26.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_27.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_28.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_29.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_30.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_3.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_4.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_5.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_6.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_7.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_8.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/rose_9.png'
]

sparkling_imgs = [
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_1.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_10.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_11.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_12.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_13.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_14.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_15.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_16.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_17.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_18.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_19.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_2.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_20.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_21.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_22.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_23.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_24.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_25.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_26.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_27.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_28.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_29.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_3.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_30.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_4.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_5.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_6.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_7.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_8.png',
  'https://vinevino-seeds.s3.us-west-1.amazonaws.com/spk_9.png'
]

puts "Creating wines..."

50.times do
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Napa Valley',
    country: 'USA',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: red_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Red'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Bordeaux',
    country: 'France',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: red_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Red'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Tuscany',
    country: 'Italy',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: red_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Red'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Napa Valley',
    country: 'USA',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: white_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'White'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Bordeaux',
    country: 'France',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: white_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'White'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Tuscany',
    country: 'Italy',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: white_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'White'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Napa Valley',
    country: 'USA',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: rose_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Rose'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Bordeaux',
    country: 'France',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: rose_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Rose'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: 'Tuscany',
    country: 'Italy',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: rose_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Rose'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Napa Valley',
    country: 'USA',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: sparkling_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Sparkling'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Bordeaux',
    country: 'France',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: sparkling_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Sparkling'
  )
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: 'Tuscany',
    country: 'Italy',
    price: Faker::Commerce.price(range: 5..500, as_string: false),
    year: rand(1980..2023),
    image: sparkling_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Sparkling'
  )
end

50.times do
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: regions.sample,
    country: countries.sample,
    price: Faker::Commerce.price(range: 5..120, as_string: false),
    year: rand(1980..2023),
    image: red_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Red'
  )
end

50.times do
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: regions.sample,
    country: countries.sample,
    price: Faker::Commerce.price(range: 5..120, as_string: false),
    year: rand(1980..2023),
    image: white_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'White'
  )
end

50.times do
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: red_grapes.sample,
    region: regions.sample,
    country: countries.sample,
    price: Faker::Commerce.price(range: 5..120, as_string: false),
    year: rand(1980..2023),
    image: rose_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Rose'
  )
end

50.times do
  Wine.create!(
    name: Faker::Commerce.product_name,
    grape: white_grapes.sample,
    region: regions.sample,
    country: countries.sample,
    price: Faker::Commerce.price(range: 5..120, as_string: false),
    year: rand(1980..2023),
    image: sparkling_imgs.sample,
    winery: Faker::Company.name,
    bold: rand(1..10),
    tannic: rand(1..10),
    sweet: rand(1..10),
    acidic: rand(1..10),
    wine_type: 'Sparkling'
  )
end

puts "Wine Done!"


#  ratings data generator

Rating.destroy_all

puts "Creating ratings..."

3000.times do
  Rating.create!(
    rating: Faker::Number.between(from: 3, to: 5),
    body: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: Faker::Number.between(from: 2, to: 21),
    wine_id: Faker::Number.between(from: 1, to: 500)
  )
end

puts "Ratings Done!"
