class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.references :account, null: false, foreign_key: true
      t.float :amount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
