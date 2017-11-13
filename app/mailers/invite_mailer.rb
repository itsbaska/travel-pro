class InviteMailer < ApplicationMailer
  default from: "invite@travel-pro.com"

  def invite_email(traveller, trip)
    @traveller = traveller
    @trip = trip
    mail(to: @traveller.email, subject: "You've been invited to #{@trip.name}!")
  end
end
