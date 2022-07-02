# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# account = Account.new(
#    account_name:["MCB","ABSA","SBM","AFRASIA"].sample,
#    account_type: ["savings account","current account"].sample,
#    account_number:Faker::Bank.account_number(digits: 8),
#    balance: rand(10000..100000),
#    user_id: 2
# )
# puts "account created"
# account.save

require 'faker'
require 'open-uri'
require 'json'

Transaction.destroy_all
Account.destroy_all
Category.destroy_all
User.destroy_all

user = User.create(
  email: "test@abc.com",
  password: "123456"
)
user.save
puts user

account = Account.create(
  account_name: "Savings",
  account_type: "ajdfa",
  account_number: 1234,
  balance: 100.0
)
account.user = user
account.save
puts account

category = Category.create(
  name: "Shopping"
)
category.save
puts category
transaction = Transaction.create(
  name: "Shoes",
  amount: 1200,
  date: Date.today
)
transaction.category = category
transaction.account = account
transaction.save
puts transaction

budget = Budget.create(
  amount: 1000
)
budget.category = category
budget.account = account
budget.save
puts budget



# user_list = "db/user.json"
# users_file = File.read(user_list)
# users = JSON.parse(users_file)

# puts "Creating Users"
# user_count = users["entries"].count
# x = 0
# user_count.times do
#   user1 = User.create(id: "#{users["entries"][x]["id"]}",email: "#{users["entries"][x]["email"]}", password: "#{users["entries"][x]["password"]}")
#   j = 0
#   photo_count = users["entries"][x]["photo"].count
#   photo_count.times do
#   photo = users["entries"][x]["photo"][j]
#   file = URI.open("#{photo}")
#   user1.photo.attach(io: file, filename: "user.jpg",content_type: 'image/jpg')
#   j += 1
# end
#   x += 1
# end

# puts "Users created"

# account_list = "db/account.json"
# accounts_file = File.read(account_list)
# accounts = JSON.parse(accounts_file)

# puts "creating Accounts"
# account_count = accounts["entries"].count
# y = 0
# account_count.times do
#   account_1 = Account.create(
#     id: "#{accounts["entries"][y]["id"]}",
#     account_name: "#{accounts["entries"][y]["account_name"]}",
#     account_type: "#{accounts["entries"][y]["account_type"]}",
#     account_number: "#{accounts["entries"][y]["account_number"]}",
#     balance: "#{accounts["entries"][y]["balance"]}",
#     user_id: "#{accounts["entries"][y]["user_id"]}"
#   )
#   y += 1
# end
# puts "Account created"
# category_list = "db/category.json"
# category_file = File.read(category_list)
# categories = JSON.parse(category_file)

# transaction_list = "db/transaction.json"
# transaction_file = File.read(transaction_list)
# transactions = JSON.parse(transaction_file)

# puts "creating categories"
# category_count = categories["entries"].count
# i = 0

# # category_count.times do
# #   category1 = Category.create(name: "#{categories["entries"][i]["name"]}")
# #   puts "Created category"
# #   i += 1
# # end
# category1 = Category.create(name: "#{categories["entries"][0]["name"]}")
# puts "Categories created"

# puts "creating transactions"
# transaction_count = transactions["entries"].count
# j = 0

# transaction_count.times do
#   transaction1 = Transaction.create(
#     name: "#{transactions["entries"][j]["name"]}",
#     amount: "#{transactions["entries"][j]["amount"]}",
#     date: "#{transactions["entries"][j]["date"]}",
#     account_id: "#{transactions["entries"][j]["account_id"]}"
#   )
#   transaction1.category = category1
#   transaction1.account =


#   if transaction1.save
#     puts transaction_count
#     puts "Created transaction"
#   end
#   j += 1
# end

# puts "transaction created"
