class RemovePoolIdFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :projects, column: :pool_id
  end
end
