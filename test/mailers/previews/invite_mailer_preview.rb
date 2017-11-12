class InviteMailerPreview < ActionMailer::Preview
  def invite_email
    InviteMailer.invite_email(User.first)
  end
end
