class AddBanktoUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank, :string 
  end
end
