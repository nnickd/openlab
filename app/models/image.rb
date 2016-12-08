class Image < ApplicationRecord
  belongs_to :project
  has_attached_file :pic, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/galaxy.jpg'
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
end
