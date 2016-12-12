class AddManagedIdToStripeAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :stripe_accounts, :managed_id, :string
  end
end
