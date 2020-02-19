# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do  
    Book.create([{
        isbn: Faker::Alphanumeric.alphanumeric(number: 10),
        name: Faker::Name.name,
        desc: Faker::Lorem.paragraphs,
        author: Faker::Name.name,
        image: Faker::Avatar.image,
        books_total: Faker::Number.number(digits: 3),
        status: Faker::Boolean.boolean, 
        category_id: Faker::Number.between(from: 1, to: 2),
        price: Faker::Number.decimal(l_digits: 3, r_digits: 3)
    }])
end
