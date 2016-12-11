class ExternalAccount < ApplicationRecord
  belongs_to :stripe_account
  has_many :pools
end
