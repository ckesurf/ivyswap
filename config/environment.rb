# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
IvyswapApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "bennapp",
  :password => "tannerdont",
  :domain => "cuex.herokuapp.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}