class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      company: params[:company],
      email: params[:email],
      subject: params[:subject],
      message: params[:message]
      )

    if @contact.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page show du contact
      redirect_to contact_path(@contact.id)
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render "new"
    end
  end
end
