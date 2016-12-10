class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :country
      t.string :state
      t.string :line1
      t.string :line2
      t.integer :postal_code
      t.string :state
      t.references :stripe_account, foreign_key: true

      t.timestamps
    end
  end
end
