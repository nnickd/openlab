class Address < ApplicationRecord
  belongs_to :stripe_account

  validates :city, :state, :line1, :postal_code, presence: :true
end
