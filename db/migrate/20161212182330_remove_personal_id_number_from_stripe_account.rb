class RemovePersonalIdNumberFromStripeAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :stripe_accounts, :personal_id_number, :integer
  end
end
