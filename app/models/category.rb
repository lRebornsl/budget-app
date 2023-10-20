class Category < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_and_belongs_to_many :payments
  has_one_attached :icon

  def total_payment_amount
    payments.sum(:amount)
  end
end
