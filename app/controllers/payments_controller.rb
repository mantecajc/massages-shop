class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    massage = Massage.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          currency: "eur",
          unit_amount: massage.price * 100,
          product_data: {
              name: massage.title,
              description: massage.brief_description,
              images: [massage.photo.url],
          },
        },
      }],
      mode: 'payment',
      success_url: checkout_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: massage_url(massage),
    })

  # TODO: to test
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  def checkout
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    @email = session[:customer_details][:email]
    @name = session[:customer_details][:name]
    @checkout_id =  session[:id]

    UserMailer.payment_success(@name, @email, @checkout_id).deliver_now
  end
end
