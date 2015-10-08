# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  account_name :string
#  real_balance :decimal(, )
#  calc_balance :decimal(, )
#  user_id      :integer
#  meta         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item         :string
#  account_type :string
#  sub_type     :string
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  def self.populate_user_bank_accounts(user, api_account_data)

  api_account_data.each do |account|
    Account.create_bank_account(account,user)
    end
  end

  def self.create_bank_account(account,user)

    account_name = account["meta"]["name"]
    meta = account ["meta"]["number"]
    real_balance = account["balance"]["available"]
    if real_balance.nil?
      real_balance == 0.to_s.to_d
    end
    account_type = account["type"]
    sub_type = account["subtype"]
    calc_balance = real_balance
    account = Account.create(account_name: account_name, meta:
    meta, real_balance: real_balance, account_type: account_type, sub_type: sub_type, user_id: user.id)
    return account

  end

  def self.update_bank_balance(user, api_account_data)
  end

end
