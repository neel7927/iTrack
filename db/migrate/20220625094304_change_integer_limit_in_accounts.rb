class ChangeIntegerLimitInAccounts < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :account_number, :integer, limit: 8
  end
end
