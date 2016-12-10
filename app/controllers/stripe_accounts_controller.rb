class StripeAccountsController < ApplicationController
  def create
    @stripe_account = stripe_account.new(stripe_account_params)
    return redirect_to @stripe_account.user. unless @stripe_account.save
    redirect_to @stripe_account.user, notice: 'stripe_account was successfully posted.'
  end

  private

  def stripe_account_params
    params.require(:stripe_account).permit(:first_name, :last_name, :last_4_social)
  end
end
