class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token_id, :string
  end
end
