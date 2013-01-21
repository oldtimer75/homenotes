class NotificationsMailer < ActionMailer::Base
	default :from => "support@homenotes.co"
	default :to => "support@homenotes.co"

	def new_message(message)
		@message = message
		mail(:subject => "[HomeNotes.co] #{message.subject}")
	end

	def registration_confirmation(user)
		@user = user
		mail(to: user.email, subject: "HomeNotes: Thank You for Registering")
	end
end
