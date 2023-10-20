class Category < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_and_belongs_to_many :payments
  has_one_attached :icon

  validates :name, presence: true
  validate :icon_attached

  def icon_attached
    errors.add(:icon, 'must be attached') unless icon.attached?
  end

  def total_payment_amount
    payments.sum(:amount)
  end
end
