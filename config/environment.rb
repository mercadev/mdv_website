# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['CONTACT_MAIL_LOGIN'],
  :password => ENV['CONTACT_MAIL_PWD'],
  :domain => 'mercadev.fr',
  :address => 'ssl0.ovh.net',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :ssl => true
}
