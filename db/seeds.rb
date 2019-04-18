# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when "development"
  unless AdminUser.where(email: 'matthew.parlette@gmail.com')
    AdminUser.create!(email: 'matthew.parlette@gmail.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
  end
end
