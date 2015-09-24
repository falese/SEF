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
#

class Account < ActiveRecord::Base
  belongs_to :user
end
