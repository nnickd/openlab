class StripeAccountsController < ApplicationController
  def create
    @stripe_account = StripeAccount.new(stripe_account_params)
    return redirect_to users_path unless @stripe_account.save

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    account = Stripe::Account.create(
      managed: true,
      country: @stripe_account.country,
      legal_entity: {
        type: 'individual',
        first_name: @stripe_account.first_name,
        last_name: @stripe_account.last_name,
        ssn_last_4: @stripe_account.last_4_social,
        dob: {
          day: @stripe_account.date_of_birth.day,
          month: @stripe_account.date_of_birth.month,
          year: @stripe_account.date_of_birth.year
        }
      }
    )

    @stripe_account.update(managed_id: account.id)
    redirect_to users_path, notice: 'stripe account was successfully created.'
  end

  def update
    set_stripe_account
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    byebug
  end

  private

  def set_stripe_account
    @stripe_account = StripeAccount.find(params[:id])
  end

  def stripe_account_params
    params.require(:stripe_account).permit(:first_name, :last_name, :country, :last_4_social, :date_of_birth, :user_id, :verified)
  end
end
