class ChargesController < ApplicationController

  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "BigMoney Membership - #{current_user.name}",
      currency: 'usd'
    )

    flash[:success] = "Thanks for all the money. #{current_user.name}"

    account = current_user.account
    account.plan = "paid"
    account.save!


    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_hash = {
      src: "https://checkout.stripe.com/checkout.js",
      class: 'stripe-button',
        data: {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: 9_000_00
      # We're like the Snapchat for Wikipedia. But really,
      # change this amount. Stripe won't charge $9 billion.
    }
    }

  end
end
