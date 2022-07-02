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
Budget.destroy_all
Account.destroy_all
Category.destroy_all
User.destroy_all

user_list = "db/user.json"
users_file = File.read(user_list)
users = JSON.parse(users_file)
# create users
puts "Creating Users"
user_count = users["entries"].count
x = 0
user_count.times do
user1 = User.create(email: "#{users["entries"][x]["email"]}", password: "#{users["entries"][x]["password"]}", name: "#{users["entries"][x]["name"]}")
  j = 0
  photo_count = users["entries"][x]["photo"].count
  photo_count.times do
  photo = users["entries"][x]["photo"][j]
  file = URI.open("#{photo}")
  user1.photo.attach(io: file, filename: "user.jpg", content_type: 'image/jpg')
  j += 1
  end
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
  account_1 = Account.new(
    account_name: "#{accounts["entries"][y]["account_name"]}",
    account_type: "#{accounts["entries"][y]["account_type"]}",
    account_number: "#{accounts["entries"][y]["account_number"]}",
    balance: "#{accounts["entries"][y]["balance"]}"
  )
  account_1.user = User.first
  account_1.save
  y += 1
end
puts "Account created"

category_list = "db/category.json"
category_file = File.read(category_list)
categories = JSON.parse(category_file)

transaction_list = "db/transaction.json"
transaction_file = File.read(transaction_list)
transactions = JSON.parse(transaction_file)

# income json
income_transaction_list = "db/income.json"
income_transaction_file = File.read(income_transaction_list)
income_transactions = JSON.parse(income_transaction_file)

# eating out json
eating_transaction_list = "db/eating.json"
eating_transaction_file = File.read(eating_transaction_list)
eating_transactions = JSON.parse(eating_transaction_file)

# grocery json
grocery_transaction_list = "db/grocery.json"
grocery_transaction_file = File.read(grocery_transaction_list)
grocery_transactions = JSON.parse(grocery_transaction_file)

# shopping json
shopping_transaction_list = "db/shopping.json"
shopping_transaction_file = File.read(shopping_transaction_list)
shopping_transactions = JSON.parse(shopping_transaction_file)

# transport json
transport_transaction_list = "db/transport.json"
transport_transaction_file = File.read(transport_transaction_list)
transport_transactions = JSON.parse(grocery_transaction_file)

# utility json
utility_transaction_list = "db/utility.json"
utility_transaction_file = File.read(utility_transaction_list)
utility_transactions = JSON.parse(utility_transaction_file)

# create categories
puts "creating categories"
transport_category = Category.create(name: "#{categories["entries"][0]["name"]}")
shopping_category = Category.create(name: "#{categories["entries"][1]["name"]}")
grocery_category = Category.create(name: "#{categories["entries"][2]["name"]}")
eating_category = Category.create(name: "#{categories["entries"][3]["name"]}")
utility_category = Category.create(name: "#{categories["entries"][4]["name"]}")
income_category = Category.create(name: "#{categories["entries"][5]["name"]}")
puts "creating categories"

# transaction_count = transactions["entries"].count
# j = 0
# transaction_count.times do
#   transaction1 = Transaction.new(
#     name: "#{transactions["entries"][j]["name"]}",
#     amount: "#{transactions["entries"][j]["amount"]}",
#     date: "#{transactions["entries"][j]["date"]}"
#   )
#   transaction1.account = Account.last
#   transaction1.category = Category.last
#   transaction1.save
#   j += 1
# end

# create income transactions
income_count = income_transactions["entries"].count
a = 0
income_count.times do
  inc_transaction = Transaction.new(
    name: "#{income_transactions["entries"][a]["name"]}",
    amount: "#{income_transactions["entries"][a]["amount"]}",
    date: "#{income_transactions["entries"][a]["date"]}"
  )
  inc_transaction.account = Account.last
  inc_transaction.category = income_category
  inc_transaction.save
  a += 1
end
puts "income transactions created"

# create eating transactions
eating_count = eating_transactions["entries"].count
b = 0
eating_count.times do
  eat_transaction = Transaction.new(
    name: "#{eating_transactions["entries"][b]["name"]}",
    amount: "#{eating_transactions["entries"][b]["amount"]}",
    date: "#{eating_transactions["entries"][b]["date"]}"
  )
  eat_transaction.account = Account.last
  eat_transaction.category = eating_category
  eat_transaction.save
  b += 1
end
puts "eating transactions created"

# create grocery transactions
grocery_count = grocery_transactions["entries"].count
c = 0
grocery_count.times do
  groc_transaction = Transaction.new(
    name: "#{transactions["entries"][c]["name"]}",
    amount: "#{transactions["entries"][c]["amount"]}",
    date: "#{transactions["entries"][c]["date"]}"
  )
  groc_transaction.account = Account.last
  groc_transaction.category = grocery_category
  groc_transaction.save
  c += 1
end
puts "grocery transactions created"

# create shopping transactions
shopping_count = shopping_transactions["entries"].count
d = 0
shopping_count.times do
  shop_transaction = Transaction.new(
    name: "#{transactions["entries"][d]["name"]}",
    amount: "#{transactions["entries"][d]["amount"]}",
    date: "#{transactions["entries"][d]["date"]}"
  )
  shop_transaction.account = Account.last
  shop_transaction.category = shopping_category
  shop_transaction.save
  c += 1
end
puts "grocery transactions created"
