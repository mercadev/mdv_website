class ContactsController < ApplicationController
  def new
  end

  def create
    Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      company: params[:company],
      email: params[:email],
      subject: params[:subject],
      message: params[:message]
    )
  end
end
