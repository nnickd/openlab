class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    return redirect_to users_path unless @address.save
    redirect_to users_path, notice: 'Address was successfully posted.'
  end

  private

  def address_params
    params.require(:address).permit(:city, :country, :state, :line1, :line2, :postal_code, :stripe_account_id)
  end
end
