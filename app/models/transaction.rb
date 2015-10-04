# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  description :string
#  amount      :decimal(, )
#  date        :date
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Transaction < ActiveRecord::Base
  belongs_to :account
end
