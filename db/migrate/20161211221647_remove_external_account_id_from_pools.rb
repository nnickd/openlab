class RemoveExternalAccountIdFromPools < ActiveRecord::Migration[5.0]
  def change
    remove_column :pools, :external_account_id, :integer
  end
end
