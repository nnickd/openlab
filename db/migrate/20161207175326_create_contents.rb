class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :project, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
