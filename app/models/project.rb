class Project < ApplicationRecord
  belongs_to :user
  has_one :pool
  has_many :logs, dependent: :destroy
  has_many :images
  has_one :video

  validates :title, presence: true, uniqueness: true

  scope :posted?, -> { where(posted: true) }

  def self.search(term)
    where(['title LIKE ?', "%#{term}%"])
  end

  def postable?
    pool && about && context && significance && goals ? true : false
  end
end
