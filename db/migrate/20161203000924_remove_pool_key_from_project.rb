class RemovePoolKeyFromProject < ActiveRecord::Migration[5.0]
  def change
     remove_column :projects, :pool_id, :integer
  end
end
