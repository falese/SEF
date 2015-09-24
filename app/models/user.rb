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
end
