class Project < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  def to_param
    self.title
  end
end
