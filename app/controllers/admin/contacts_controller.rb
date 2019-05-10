class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def send_prospect_emails
    puts "TEST PROPECT PARAMS :" + params.to_s
    params["youpi"] = "blabla"
    @youpi = "blabla"
    # redirect_to prospect_emails_sent_path(ids: params[:contact_ids])
    render "prospect_emails_sent"
  end

  def prospect_emails_sent
    puts "test1 --> " + @youpi.to_s
    puts "TEST PROPECT PARAMS BIS :" + params.to_s
  end
end
