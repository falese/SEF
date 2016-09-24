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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
