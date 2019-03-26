class Contact < ApplicationRecord
  after_create :email_send

  validates :first_name, presence: { message: "Vous n'avez saisi aucun prénom." }
  validates :last_name, presence: { message: "Vous n'avez saisi aucun nom." }
  validates :email, presence: { message: "Vous n'avez saisi aucun e-mail." }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'e-mail saisi est incorrect." }
  validates :subject, presence: { message: "Vous n'avez saisi aucun un objet pour votre message." }
  validates :message, presence: { message: "Vous n'avez saisi aucun message." }

  def email_send
    AdminMailer.contact_email(self).deliver_now
  end
end
