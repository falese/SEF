# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  account_name    :string
#  real_balance    :decimal(, )
#  calc_balance    :decimal(, )      default(0.0)
#  user_id         :integer
#  meta            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  item            :string
#  account_type    :string
#  sub_type        :string
#  bank_account_id :string
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  def self.populate_user_bank_accounts(user, api_account_data)
      api_account_data.each do |account|
      
        if Account.where(bank_account_id: account["_id"]).find_each != nil
            acct = Account.find_by(bank_account_id: account["_id"])
            Account.update_bank_account(account, user, acct)
        else
           Account.create_bank_account(account,user)
        end
      end
  end

  def self.create_bank_account(account,user)

    account_name = account["meta"]["name"]
    meta = account ["meta"]["number"]
    real_balance = account["balance"]["available"]
    account_type = account["type"]
    sub_type = account["subtype"]
    calc_balance = real_balance
    bank_id = account["_id"]
    account = Account.create(account_name: account_name, meta:
    meta, real_balance: real_balance, account_type: account_type, sub_type: sub_type, user_id: user.id, bank_account_id: bank_id)
    return account
  end

  def self.update_bank_account(account, user, acct)
    real_balance = account["balance"]["available"]
    Account.update(acct.id, real_balance: real_balance)
  end



end
