class AdminMailer < ApplicationMailer
  default from: 'contact_mailer@mercadev.fr'

  RECEIVERS = [
    'cristiano.ferreira.dev@gmail.com'
    # 'c.ferreira@mercadev.fr',
    # 'n.guenu@mercadev.fr'
  ]

  def user_contact_email(user_contact)
    # on récupère l'instance contact pour ensuite pouvoir la passer à la view
    @contact = user_contact

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire(s) et sujet.
    mail(to: RECEIVERS, subject: 'Nouveau contact sur mercadev.fr')
  end

  def prospect_email(prospect)
    # on récupère l'instance contact pour ensuite pouvoir la passer à la view
    @contact = prospect

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire(s) et sujet.
    mail(to: RECEIVERS, subject: 'Nouveau contact sur mercadev.fr')
  end
end
