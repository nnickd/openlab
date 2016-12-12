class AddCountryToStripeAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :stripe_accounts, :country, :string
  end
end
