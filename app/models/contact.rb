class Contact < ApplicationRecord
  after_create :email_send

  def email_send
    AdminMailer.contact_email(self).deliver_now
  end
end
