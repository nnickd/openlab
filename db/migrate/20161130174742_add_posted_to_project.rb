class AddPostedToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :posted, :boolean
  end
end
