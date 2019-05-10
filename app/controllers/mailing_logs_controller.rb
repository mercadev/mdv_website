class MailingLogsController < ApplicationController

  def index
    @logs = MailingLog.all
  end

  def create
    puts "TEST PROPECT PARAMS :" + params[:contact_ids]

    params[:contact_ids].each { |id|
      MailingLog.create(contact: id, status:"none", messages_count:0)
    }

    redirect_to mailing_logs_path
  end

end

