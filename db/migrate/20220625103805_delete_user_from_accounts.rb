class DeleteUserFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :user_id
  end
end
