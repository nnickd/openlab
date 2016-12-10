class StripeAccountsController < ApplicationController
  def create
    @stripe_account = StripeAccount.new(stripe_account_params)
    return redirect_to users_path unless @stripe_account.save
    redirect_to users_path, notice: 'stripe_account was successfully posted.'
  end

  private

  def stripe_account_params
    params.require(:stripe_account).permit(:first_name, :last_name, :last_4_social, :user_id)
  end
end
