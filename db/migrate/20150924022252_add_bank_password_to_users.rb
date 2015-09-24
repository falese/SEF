class AddBankPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_password, :string
  end
end
