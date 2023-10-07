class UserMailer < ApplicationMailer
  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(to: 'lesmassagesdepauline49@gmail.com', subject: 'Nouveau message | Les Massages de Pauline')
  end

  def payment_success(name, email, checkout_id)
    @name = name
    @email = email
    @checkout_id = checkout_id
    mail(to: email, subject: "Votre commande | Les Massages de Pauline")
  end
end
