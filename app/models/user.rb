class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :payments
  has_many :logs
  validates :username, presence: true
end
