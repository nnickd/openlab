class CreateStripeAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :stripe_accounts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :last_4_social
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
