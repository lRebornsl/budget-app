class Payment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def self.total_amount
    sum(:amount)
  end
end
