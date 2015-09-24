# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  user_name      :string
#  email          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bank           :string
#  bank_password  :string
#  bank_user_name :string
#

class User < ActiveRecord::Base
  has_many :accounts
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid      = auth.uid
    user.user_name     = auth.info.name
    user.save
  end
end





  # def self.from_omniauth(auth)
  #     where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.name = auth.info.name
  #       user.oauth_token = auth.credentials.token
  #       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #       user.save!
  #     end
  #   end


end
