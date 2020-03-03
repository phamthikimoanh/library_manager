# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

4.times do  
    Book.create([{
        isbn: Faker::Alphanumeric.alphanumeric(number: 10),
        name: Faker::Name.name,
        desc: Faker::Lorem.paragraphs,
        author: Faker::Name.name,
        image: Faker::Avatar.image,
        books_total: Faker::Number.number(digits: 3),
        status: Faker::Boolean.boolean, 
        category_id: Faker::Number.between(from: 1, to: 4),
        price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        user_id: Faker::Number.between(from: 1, to: 4),
    }])
end

4.times do  
    Category.create([{
        name: Faker::Name.name,
    }])
end

4.times do  
    User.create([{
        email: Faker::Name.email,
        encrypted_password: Faker::Code.nric(min_age: 27, max_age: 34),
        name: Faker::Name.name, 
        phone: Faker::PhoneNumber.cell_phone_with_country_code,
        birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
        address: Faker::Address.full_address,
        admin: Faker::Boolean.boolean(true_ratio: 0.2),
        image: Faker::Avatar.image,
    }])
end

# 4.times do  
#     BookOrder.create([{
#         amount_book: Faker::Number.between(from: 1, to: 5),
#         brorrow_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
#         status: Faker::Boolean.boolean, 
#         user_id: Faker::Number.between(from: 1, to: 4),
#         deposits: Faker::Number.decimal(l_digits: 3, r_digits: 3)
#     }])
# end
