class MailingLogsController < ApplicationController

  def index
    @logs = MailingLog.all
  end

  def create
    puts "TEST PROPECT PARAMS :" + params[:contact_ids].to_s


    params[:contact_ids].each { |id|
      contact = Contact.find(id)
      log = MailingLog.find_by(contact: contact)
      if log != nil
        log.update(messages_count: log.messages_count + 1)
      else
        log = MailingLog.create(contact: contact, status:"none", messages_count:0)
      end

      AdminMailer.prospect_email(contact).deliver_now
      log.update(status: "sent")
    }

    redirect_to mailing_logs_path
  end

end

