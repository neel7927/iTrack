class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :account_type
      t.integer :account_number
      t.float :balance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
