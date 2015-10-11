class AddbankIDtoAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :bank_account_id, :string
  end
end
