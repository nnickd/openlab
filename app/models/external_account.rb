class ExternalAccount < ApplicationRecord
  belongs_to :stripe_account
end
