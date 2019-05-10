class Contact < ApplicationRecord
  has_one :mailing_log
  # after_create :send_email

  # validates :first_name, presence: { message: "Vous n'avez saisi aucun prénom." }
  # validates :last_name, presence: { message: "Vous n'avez saisi aucun nom." }
  # validates :email, presence: { message: "Vous n'avez saisi aucun e-mail." }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'e-mail saisi est incorrect." }
  # validates :subject, presence: { message: "Vous n'avez saisi aucun un objet pour votre message." }
  # validates :message, presence: { message: "Vous n'avez saisi aucun message." }
end
