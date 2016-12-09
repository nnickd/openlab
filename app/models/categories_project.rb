class CategoriesProject < ApplicationRecord
  belongs_to :project
  belongs_to :category

  # scope :catsort, -> 
end
