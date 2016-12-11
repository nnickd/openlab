class StripeAccount < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :external_accounts
end
