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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
