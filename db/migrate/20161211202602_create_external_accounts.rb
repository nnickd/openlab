class CreateExternalAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :external_accounts do |t|
      t.string :kind
      t.string :token
      t.string :currency
      t.string :country
      t.references :stripe_account, foreign_key: true

      t.timestamps
    end
  end
end
