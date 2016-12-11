class AddExternalAccountReferenceToPool < ActiveRecord::Migration[5.0]
  def change
    add_reference :pools, :external_account, foreign_key: true
  end
end
