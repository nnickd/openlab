class Pool < ApplicationRecord
  belongs_to :project
  has_many :payments
end
