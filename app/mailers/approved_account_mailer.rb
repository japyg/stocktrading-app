class ApprovedAccountMailer < ApplicationMailer
  def approve_email
    @email = params[:email]
    mail(to: @email, subject: 'Your account has been approved!')
  end
end