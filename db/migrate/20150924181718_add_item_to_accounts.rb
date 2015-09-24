class AddItemToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :item, :string
    add_column :accounts, :type, :string
    add_column :accounts, :sub_type, :string
  end
end
