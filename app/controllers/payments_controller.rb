class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    @payment.amount = params[:amount].to_i
    @payment.save

    @payment.pool.add_payment(@payment)

    @amount = params[:amount].delete('$').delete(',')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'payment not completed. Please enter a valid amount in USD ($).'
      redirect_to new_payment_path
      return
    end

    @amount = (@amount * 100).to_i # Must be an integer!

    if @amount < 500
      flash[:error] = 'payment not completed. Donation amount must be at least $5.'
      redirect_to new_payment_path
      return
    end

    Stripe::Charge.create(
      amount: @amount,
      currency: 'usd',
      source: params[:stripeToken],
      description: 'Custom donation'
    )
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
