class StripeAccount < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :external_accounts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :last_4_social, presence: true
  validates :date_of_birth, presence: true

end
