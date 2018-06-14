class UserMailer < ApplicationMailer
  default from: 'sign-up@99cats.com'

  def welcome_email(user)
    @user = user
    @url = 'http://99cats.com/login'
    mail(to: "madeup@email.com", subject: 'Welcome to 99Cats!')
  end
end
