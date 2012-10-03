class NotificationsMailer < ActionMailer::Base
  default :from => "support@homenotes.co"
  default :to => "support@homenotes.co"

  def new_message(message)
    @message = message
    mail(:subject => "[HomeNotes.co] #{message.subject}")
  end

end
