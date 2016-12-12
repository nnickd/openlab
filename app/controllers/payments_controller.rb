class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    @amount = params[:amount].delete('$').delete(',')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'payment not completed. Please enter a valid amount in USD ($).'
      redirect_to new_payment_path
      return
    end

    @amount = (@amount * 100).to_i

    if @amount < 500
      flash[:error] = 'payment not completed. Donation amount must be at least $5.'
      redirect_to new_payment_path
      return
    end

    charge = Stripe::Charge.create(
      amount: @amount,
      currency: 'usd',
      source: params[:stripeToken],
      destination: @payment.pool.creator.stripe_account.managed_id,
      description: 'Custom donation'
    )

    @payment.amount = charge.amount / 100
    @payment.save
    @payment.pool.add_payment(@payment)

    redirect_to @payment.pool.project

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :pool_id)
  end
end
