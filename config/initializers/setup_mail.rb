#mail smtp details goes here
ActionMailer::Base.smtp_settings = {
  :address              => "",
  :port                 => 587,
  :domain               => "",
  :user_name            => "",
  :password             => "",
  :authentication       => 'plain',
  :enable_starttls_auto => true
}