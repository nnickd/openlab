class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    return redirect_to @address.stripe_account.user. unless @address.save
    redirect_to @address.stripe_account.user, notice: 'Address was successfully posted.'
  end

  private

  def address_params
    params.require(:address).permit(:city, :country, :state, :line1, :line2, :postal_code, :stripe_account_id)
  end
end
