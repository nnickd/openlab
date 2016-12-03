class AddProjectIdToPool < ActiveRecord::Migration[5.0]
  def change
    add_column :pools, :project_id, :integer
  end
end
