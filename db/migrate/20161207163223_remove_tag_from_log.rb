class RemoveTagFromLog < ActiveRecord::Migration[5.0]
  def change
    remove_column :logs, :tag, :string
  end
end
