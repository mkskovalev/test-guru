class ApplicationMailer < ActionMailer::Base
  default from: %{"Test Guru <mail@testguru.ru>"}
  layout 'mailer'
end
