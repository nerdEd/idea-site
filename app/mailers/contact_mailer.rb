class ContactMailer < ActionMailer::Base
  default to: ENV['ADMIN_EMAIL']

  def inquiry(contact)
    @contact = contact
    mail reply_to: contact.email, from: contact.email, subject: '[Idea Site] Contact Message'
  end
end
