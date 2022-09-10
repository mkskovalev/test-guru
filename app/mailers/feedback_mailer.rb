class FeedbackMailer < ApplicationMailer
  def feedback_email(email, message)
    @email = email
    @message = message
    mail to: "maxonemore@ya.ru", subject: 'New feedback on Test Guru'
  end
end
