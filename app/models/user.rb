class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :payments
  validates :username, presence: true
end
