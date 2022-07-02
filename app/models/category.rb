class Category < ApplicationRecord
  has_many :transactions
  has_one :budget
end
