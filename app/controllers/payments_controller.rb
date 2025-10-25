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
      success_url: checkout_url + "?session_id={CHECKOUT_SESSION_ID}" + "&name=#{massage.title.parameterize}" + "&duration=#{massage.duration}",
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
    @massage_title = params[:name]
    @massage_duration = params[:duration]
    @checkout_id = session[:id].slice(-20, 20)
    @date_start_validity = Time.at(session[:created]).strftime("%d-%m-%Y")
    @date_end_validity = FetchEndValidityDate.new(@date_start_validity, 6).call

    html_content = ApplicationController.render(
      partial: "user_mailer/payment_success",
      locals: {
        name: @name,
        massage_title: @massage_title,
        massage_duration: @massage_duration,
        checkout_id: @checkout_id,
        date_start_validity: @date_start_validity,
        date_end_validity: @date_end_validity
      }
    )

    GenerateGiftPdf.new(@massage_title, @massage_duration, @date_end_validity, @checkout_id).call

    attachments = [
      {
        'ContentType'=> 'application/pdf',
        'Filename'=> 'carte_cadeau.pdf',
        'Base64Content'=> Base64.encode64(File.read("carte_cadeau.pdf"))
      }
    ]

    SendEmailService.new(
      to: @email,
      html_content: html_content,
      subject: "Votre commande | Les Massages de Pauline",
      attachments: attachments).call
  end
end
