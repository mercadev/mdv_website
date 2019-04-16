class ContactsController < ApplicationController
  def new
    @contact = UserContact.new
  end

  def create
    # @contact = UserContact.new(
    @contact = UserContact.new(permitted_params)
    @contact.source = "input_user"

    if @contact.save # essaie de sauvegarder dans la bdd

      # si ça marche, il redirige vers la page show
      redirect_to contact_path(@contact.id)
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render "new"
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def permitted_params
      params.require(:user_contact).permit(:first_name, :last_name, :company, :email, :subject, :message) # "subject" et "message" sont des attributs non persistants
    end
  end
