class AddProjectIdToImage < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :project_id, foreign_key: true
  end
end
