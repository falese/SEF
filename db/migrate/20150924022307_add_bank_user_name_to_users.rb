class AddBankUserNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_user_name, :string
  end
end
