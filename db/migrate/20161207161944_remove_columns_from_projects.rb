class RemoveColumnsFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :about, :string
    remove_column :projects, :context, :string
    remove_column :projects, :significance, :string
    remove_column :projects, :goals, :string
  end
end
