class AddPoolIdToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :pool_id, :integer
  end
end
