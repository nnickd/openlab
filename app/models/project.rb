class Project < ApplicationRecord
  belongs_to :user
  has_one :pool
  has_many :logs, dependent: :destroy
  validates :title, presence: true, uniqueness: true

  def self.search(term)
    where(['title LIKE ?', "%#{term}%"])
  end
end
