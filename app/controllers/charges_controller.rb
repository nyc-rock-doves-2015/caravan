class ChargesController < ApplicationController
  
  def new
  end

  def create
    p params
    # Amount in cents
    # needs to be data amount
    @amount = session[:rate]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      # TODO: this needs to be unique for each user??
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => 10000,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
