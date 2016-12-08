class Content < ApplicationRecord
  belongs_to :project
  validates :body, presence: true
end
