class Project < ApplicationRecord
  belongs_to :user
  has_one :pool
  has_many :logs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_one :video, dependent: :destroy
  has_many :contents, dependent: :destroy

  has_many :categories_projects
  has_many :categories, through: :categories_projects

  validates :title, presence: true, uniqueness: true

  scope :posted?, -> { where(posted: true) }

  def self.search(term)
    where(['title LIKE ?', "%#{term}%"])
  end

  def postable?
    pool && video && categories.length >= 1 && contents.length >= 4 && user.stripe_account ? true : false
  end

  def has_two_categories?
    categories.length >= 2 ? true : false
  end

end
