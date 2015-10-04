class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount
      t.date :date
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
