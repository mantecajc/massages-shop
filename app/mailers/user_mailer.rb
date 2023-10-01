class UserMailer < ApplicationMailer
  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(to: 'lesmassagesdepauline49@gmail.com', subject: 'Nouveau message | Les Massages de Pauline')
  end
end
