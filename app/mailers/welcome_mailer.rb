class WelcomeMailer < ApplicationMailer
  default from: "invite@travel-pro.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to travel-pro.com')
  end
end
