class MailingLogsController < ApplicationController

def index
    @logs = MailingLog.all
  end

end

