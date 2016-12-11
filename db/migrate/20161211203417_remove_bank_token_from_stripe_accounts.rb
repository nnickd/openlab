class RemoveBankTokenFromStripeAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :stripe_accounts, :bank_token, :string
  end
end
