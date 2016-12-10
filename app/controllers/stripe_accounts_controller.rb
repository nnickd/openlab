class StripeAccountsController < ApplicationController
  def create
    @stripe_account = StripeAccount.new(stripe_account_params)
    return redirect_to users_path unless @stripe_account.save

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    Stripe::Account.create(
      managed: true,
      country: 'US',
      legal_entity: {
        type: 'individual',
        first_name: @stripe_account.first_name,
        last_name: @stripe_account.last_name,
        ssn_last_4: @stripe_account.last_4_social
      }
    )

    redirect_to users_path, notice: 'stripe_account was successfully created.'
  end

  private

  def stripe_account_params
    params.require(:stripe_account).permit(:first_name, :last_name, :last_4_social, :user_id)
  end
end
