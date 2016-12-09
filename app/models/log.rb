class Log < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :title, :body, presence: true
end
