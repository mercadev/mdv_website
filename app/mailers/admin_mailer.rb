class AdminMailer < ApplicationMailer
  default from: 'no-reply@mercadev.fr'
 
  def contact_email(contact)
    # on récupère l'instance contact pour ensuite pouvoir la passer à la view
    @contact = contact 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire(s) et sujet.
    mail(to: ['c.ferreira@mercadev.fr', 'n.guenu@mercadev.fr'], subject: 'Nouveau contact sur mercadev.fr')
  end
end
