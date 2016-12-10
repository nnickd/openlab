class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    return redirect_to users_path unless @address.save

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    account = Stripe::Account.retrieve @address.stripe_account.managed_id
    account.legal_entity.address.city = @address.city
    account.legal_entity.address.line1 = @address.line1
    account.legal_entity.address.postal_code = @address.postal_code
    account.legal_entity.address.state = @address.state
    account.save

    redirect_to users_path, notice: 'Address was successfully posted.'
  end

  private

  def address_params
    params.require(:address).permit(:city, :country, :state, :line1, :line2, :postal_code, :stripe_account_id)
  end
end
