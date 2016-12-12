class AddVerifiedToStripeAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :stripe_accounts, :verified, :boolean
  end
end
