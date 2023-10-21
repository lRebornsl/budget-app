class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :payments, foreign_key: :author_id
  has_many :categories, foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise.email_regexp
end
