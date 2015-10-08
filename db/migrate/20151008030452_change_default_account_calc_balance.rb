class ChangeDefaultAccountCalcBalance < ActiveRecord::Migration
  def change
    change_column_default :accounts ,:calc_balance, 0
  end
end
