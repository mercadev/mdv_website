class UserContact < Contact
  after_create :send_email

  attr_accessor :subject, :message

  validates :first_name, presence: { message: "Vous n'avez saisi aucun prénom." }
  validates :last_name, presence: { message: "Vous n'avez saisi aucun nom." }
  validates :email, presence: { message: "Vous n'avez saisi aucun e-mail." }
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'e-mail saisi est incorrect." }, if: -> { email.present? }
  validates :subject, presence: { message: "Vous n'avez saisi aucun sujet pour votre message." }
  validates :message, presence: { message: "Vous n'avez saisi aucun message." }

  def send_email
    AdminMailer.user_contact_email(self).deliver_now
  end
end
