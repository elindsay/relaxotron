class ApplicationMailer < ActionMailer::Base
  default from: "emma@ejlindsay.com"

  def example_email(email)
    mail(to: email, subject: "TEST")
  end
end
