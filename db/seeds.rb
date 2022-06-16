# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'


account = Account.new(
   account_name:["MCB","ABSA","SBM","AFRASIA"].sample,
   account_type: ["savings account","current account"].sample,
   account_number:Faker::Bank.account_number(digits: 8),
   balance: rand(10000..100000),
   user_id: 2
)
puts "account created"
account.save

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
  category1 = Category.create(name: "#{categories["entries"][i]["name"]}")
  i += 1
end

puts "creating transactions"
transaction_count = transactions["entries"].count
i = 0

transaction_count.times do
  transaction1 = Transaction.create(
  name: "#{transactions["entries"][i]["name"]}",
  amount: "#{transactions["entries"][i]["amount"]}",
  date: "#{transactions["entries"][i]["date"]}",
  category_id: "#{transactions["entries"][i]["category_id"]}",
  account_id: "#{transactions["entries"][i]["account_id"]}"
  )
  i += 1
end

puts "transaction created"
