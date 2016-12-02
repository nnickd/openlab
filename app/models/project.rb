class Project < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  has_many :logs, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  def to_param
    title
  end

  def self.search(search)
    self.where(['title LIKE ?', "%#{search}%"])
  end
end
