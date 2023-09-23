class UserMailer < ApplicationMailer
  def contact_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My App')
  end
end
