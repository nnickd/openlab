class ExternalAccountsController < ApplicationController
    def create
      @external_account = ExternalAccount.new(external_account_params)
      return redirect_to users_path unless @external_account.save

      @external_account.update(token: params[:stripeToken])

      Stripe.api_key = Rails.configuration.stripe[:secret_key]
      account = Stripe::Account.retrieve @external_account.stripe_account.managed_id
      account.external_accounts.create({external_account: params[:stripeToken]})
      account.save

      redirect_to users_path, notice: 'external account was successfully posted.'
    end

    private

    def external_account_params
      params.require(:external_account).permit(:token, :kind, :currency, :country, :stripe_account_id)
    end


end
