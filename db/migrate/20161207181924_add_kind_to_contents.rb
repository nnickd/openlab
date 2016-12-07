class AddKindToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :kind, :string
  end
end
