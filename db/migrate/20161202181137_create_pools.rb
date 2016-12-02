class CreatePools < ActiveRecord::Migration[5.0]
  def change
    create_table :pools do |t|
      t.integer :goal
      t.integer :pledged
      t.datetime :deadline

      t.timestamps
    end
  end
end
