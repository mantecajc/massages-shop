class UserMailer < ApplicationMailer
  def contact_email(info)
    # @user = user
    @info = info
    email = "toreplaceby@gmail.com"
    # email = "lesmassagesdepauline49@gmail.com"
    mail(to: email, subject: 'Nouveau message | Les Massages de Pauline')
  end
end
