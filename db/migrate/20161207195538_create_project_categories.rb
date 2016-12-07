class CreateProjectCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :project_categories, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :category, index: true
    end
  end
end
