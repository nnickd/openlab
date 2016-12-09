class ChangeLogBodyToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :logs, :body, :text
    add_column :logs, :body, :string
  end
end
