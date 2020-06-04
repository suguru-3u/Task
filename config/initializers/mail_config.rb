ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'suguru.13579515@gmail.com',
  password: '19951015Ss',
  authentication: 'plain',
  enable_starttls_auto: true
}
