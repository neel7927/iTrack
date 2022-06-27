class AddUserReferencesToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :user, null: false, foreign_key: true
  end
end
