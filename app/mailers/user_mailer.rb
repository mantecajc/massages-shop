class UserMailer < ApplicationMailer
  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(to: 'lesmassagesdepauline49@gmail.com', subject: 'Nouveau message | Les Massages de Pauline')
  end

  def payment_success(name, email, checkout_id, title, duration, session_created_at)
    @name = name
    @email = email
    @checkout_id = checkout_id
    @massage_title = title
    @massage_duration = duration
    @date_start_validity = Time.at(session_created_at).strftime("%d-%m-%Y")
    @date_end_validity = FetchEndValidityDate.new(@date_start_validity, 6).call

    GenerateGiftPdf.new(@massage_title, @massage_duration, @date_end_validity, @checkout_id).call

    attachments["carte_cadeau.pdf"] = File.read("carte_cadeau.pdf")

    mail(to: email, subject: "Votre commande | Les Massages de Pauline")
    mail(to: 'lesmassagesdepauline49@gmail.com', subject: "Nouvelle réservation : #{@checkout_id}")
  end
end
