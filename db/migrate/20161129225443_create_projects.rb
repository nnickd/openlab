class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :about
      t.text :context
      t.text :significance
      t.text :goals

      t.timestamps
    end
  end
end
