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

user_list = "db/user.json"
users_file = File.read(user_list)
users = JSON.parse(users_file)

puts "Creating Users"
user_count = users["entries"].count
x = 0
user_count.times do
  user1 = User.create(id: "#{users["entries"][x]["id"]}",email: "#{users["entries"][x]["email"]}", password: "#{users["entries"][x]["password"]}")
  x += 1
end
puts "Users created"

account_list = "db/account.json"
accounts_file = File.read(account_list)
accounts = JSON.parse(accounts_file)

puts "creating Accounts"
account_count = accounts["entries"].count
y = 0
account_count.times do
  account_1 = Account.create(
    id: "#{accounts["entries"][y]["id"]}",
    account_name: "#{accounts["entries"][y]["account_name"]}",
    account_type: "#{accounts["entries"][y]["account_type"]}",
    account_number: "#{accounts["entries"][y]["account_number"]}",
    balance: "#{accounts["entries"][y]["balance"]}",
    user_id: "#{accounts["entries"][y]["user_id"]}"
  )
  y += 1
end
puts "Account created"
category_list = "db/category.json"
category_file = File.read(category_list)
categories = JSON.parse(category_file)

transaction_list = "db/transaction.json"
transaction_file = File.read(transaction_list)
transactions = JSON.parse(transaction_file)

puts "creating categories"
category_count = categories["entries"].count
i = 0

category_count.times do
  category1 = Category.create(
   id: "#{categories["entries"][i]["id"]}",
   name: "#{categories["entries"][i]["name"]}")
  i += 1
end
puts "Categories created"

puts "creating transactions"
transaction_count = transactions["entries"].count
j = 0

transaction_count.times do
  transaction1 = Transaction.create(
    id: "#{transactions["entries"][j]["id"]}",
    name: "#{transactions["entries"][j]["name"]}",
    amount: "#{transactions["entries"][j]["amount"]}",
    date: "#{transactions["entries"][j]["date"]}",
    category_id: "#{transactions["entries"][j]["category_id"]}",
    account_id: "#{transactions["entries"][j]["account_id"]}"
  )
  j += 1
end

puts "transaction created"
