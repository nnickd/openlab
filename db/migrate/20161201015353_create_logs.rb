class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :title
      t.text :body
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
