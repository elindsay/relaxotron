class CheckoutController < ApplicationController
  def show_cart
    @products = Product.where(id: session[:my_cart])
    if @products.empty?
      redirect_to products_path
    end
    @total_in_cents = @products.sum("price_in_cents")
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
        :amount => params[:total_in_cents], # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
      # Adding product ids back into session, because stripe request will clear the session
      session[:my_cart] = params[:product_ids].split(" ")
      redirect_to "/checkout_problem"
    end
    
    #TODO
    # notify us of sale
    # reduce stock count
    
    if e.nil?
      redirect_to action: :finished, total_in_cents: params[:total_in_cents], product_ids: params[:product_ids].split(" "), street: params[:street], city: params[:city], state: params[:state], name: params[:name], zip: params[:zip]
    end
  end

  def finished
    @products = Product.find_all_by_id(params[:product_ids])
    @total_in_cents = params[:total_in_cents].to_i
    @name = params[:name]
    @street = params[:street]
    @state = params[:state]
    @city = params[:city]
    @zip = params[:zip]
  end
  
  def problem
  end
end
