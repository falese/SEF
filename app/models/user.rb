# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  user_name        :string
#  email            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  bank             :string
#  bank_password    :string
#  bank_user_name   :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  provider         :string
#  uid              :string
#  token_id         :string
#

class User < ActiveRecord::Base
  has_many :accounts
  has_many :transactions, through: :accounts


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.user_name     = auth.info.name
      user.email = auth.info.email
      user.save
    end
  end


  def pull_accounts#this connects to plaid/balance API and passes client_id (from user setup) to return a string of all accounts
    client_id = ENV["plaid_customer_id"]
    secret = ENV["plaid_secret"]
    api_url = ENV["plaid_environment"]
    get_data = RestClient.post(api_url, client_id: client_id, secret: secret, access_token: self.token_id)

    api_account_data = JSON.parse(get_data)["accounts"]

    Account.populate_user_bank_accounts(self, api_account_data)
  end
end
