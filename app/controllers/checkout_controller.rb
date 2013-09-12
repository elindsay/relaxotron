class CheckoutController < ApplicationController
  def show
    @price_in_cents = 500
  end

  def pay
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://manage.stripe.com/account
    Stripe.api_key = "sk_test_9aKZdwLrYgU7IEpexI6yvw8E"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => params[:price_in_cents], # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
      redirect_to "/checkout_problem"
    end
    redirect_to action: :finished, price_in_cents: params[:price_in_cents]
  end

  def finished
    @price_in_cents = params[:price_in_cents].to_i
  end
  
  def problem
  end
end
