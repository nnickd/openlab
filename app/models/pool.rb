class Pool < ApplicationRecord
  has_many :projects
  has_many :payments
end
