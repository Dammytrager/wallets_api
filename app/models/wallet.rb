# == Schema Information
#
# Table name: wallets
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  settled_balance :integer          default(0)
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Wallet < ApplicationRecord
  belongs_to :user

  validates :status, presence: true
  before_validation :check_status

  enum status: {
    status_active: 0,
    status_inactive: 1,
  }

  def api_output
    JSON(self.to_json).merge({recent_transactions: []})
  end

  def check_status
    return if self.status.present?

    self.status = :status_active
  end
end
